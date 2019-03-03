//
//  ViewContatcsController.swift
//  Contacts
//
//  Created by Camilo Cabana on 2/18/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

var contactsLists = [Contacts]()
var contactSearchBar = [Contacts]()

class ViewContatcsController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var contactsTableView: UITableView!
    @IBOutlet weak var contactsSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactSearchBar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell") as! ContactsCell
        cell.link = self
        let contact = contactSearchBar[indexPath.row]
        cell.name.text = "\(contact.firstName) \(contact.lastName)"
        cell.addFavotiteContactButton.backgroundColor = contact.hasFavorites ? UIColor.yellow : .gray
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            let contact = contactSearchBar[indexPath.row]
            contactsLists.removeAll { (contactToRemove) -> Bool in
                contactToRemove.firstName.elementsEqual(contact.firstName) && contactToRemove.lastName.elementsEqual(contact.lastName)
            }
            favoritesList.removeAll { (contactToRemove) -> Bool in
                contactToRemove.firstName.elementsEqual(contact.firstName) && contactToRemove.lastName.elementsEqual(contact.lastName)
            }
            contactSearchBar.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        guard !searchText.isEmpty else {
            contactSearchBar = contactsLists
            contactsTableView.reloadData()
            return
        }
        contactSearchBar = contactsLists.filter({ (contact) -> Bool in
            contact.firstName.lowercased().contains(searchText.lowercased()) || contact.lastName.lowercased().contains(searchText.lowercased())
            
        })
        contactsTableView.reloadData()
    }
    
    func callFromCell(cell: UITableViewCell){
        let whenIsTapped = contactsTableView.indexPath(for: cell)
        let addOrRemoveFavorite = contactSearchBar[whenIsTapped!.row]
        if addOrRemoveFavorite.hasFavorites == false{
            favoritesList.append(addOrRemoveFavorite)
            favoritesList.sort { (fromA, toZ) -> Bool in
                return fromA.firstName.uppercased() < toZ.firstName.uppercased()
            }
            addOrRemoveFavorite.hasFavorites = true
        }
        else{
            favoritesList.removeAll { (contactToRemove) -> Bool in
                contactToRemove.firstName.elementsEqual(addOrRemoveFavorite.firstName) && contactToRemove.lastName.elementsEqual(addOrRemoveFavorite.lastName)
            }
            addOrRemoveFavorite.hasFavorites = false
        }
        contactsTableView.reloadRows(at: [whenIsTapped!], with: .fade)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        contactsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "CurrentContact", sender: self)
    }
}

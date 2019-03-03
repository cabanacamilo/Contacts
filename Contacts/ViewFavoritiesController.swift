//
//  ViewFavoritiesController.swift
//  Contacts
//
//  Created by Camilo Cabana on 2/18/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

var favoritesList = [Contacts]()

class ViewFavoritiesController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var favoritesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "FavoritesCell")
        let contact = favoritesList[indexPath.row]
        cell.textLabel?.text = "\(contact.firstName) \(contact.lastName)"
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        favoritesTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "CurrentFavoriteContact", sender: self)
    }
    
}

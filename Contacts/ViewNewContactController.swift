//
//  ViewNewContactController.swift
//  Contacts
//
//  Created by Camilo Cabana on 2/18/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class ViewNewContactController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func doneButton(_ sender: Any) {
        if firstName.text != ""{
            let contact = Contacts()
            var checkExistingUser = false
            contact.firstName = firstName.text!
            contact.lastName = lastName.text!
            contact.phoneNumber = phoneNumber.text!
            for index in contactsLists{
                if index.firstName == firstName.text! && index.lastName == lastName.text!{
                    alertMessage(title: "Alert", message: "The Contact already exist")
                    checkExistingUser = true
                    break
                }
            }
            if checkExistingUser == false{
                contactsLists.append(contact)
                presentingViewController?.dismiss(animated: true, completion: nil)
            }
            contactsLists.sort { (fromA, toZ) -> Bool in
                return fromA.firstName.uppercased() < toZ.firstName.uppercased()
            }
            contactSearchBar = contactsLists
        }
        else{
            alertMessage(title: "Alert", message: "Add a first name")
        }
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

}

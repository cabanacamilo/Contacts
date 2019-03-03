//
//  ViewCaontactInformationController.swift
//  Contacts
//
//  Created by Camilo Cabana on 3/2/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

var myIndex = 0

class ViewCaontactInformationController: UIViewController {

    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactPhoneNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentContact = contactSearchBar[myIndex]
        contactName.text = "\(currentContact.firstName) \(currentContact.lastName)"
        contactPhoneNumber.text = currentContact.phoneNumber
    }
    

}

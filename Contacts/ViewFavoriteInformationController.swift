//
//  ViewFavoriteInformationController.swift
//  Contacts
//
//  Created by Camilo Cabana on 3/2/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit


class ViewFavoriteInformationController: UIViewController {

    @IBOutlet weak var favoriteContact: UILabel!
    @IBOutlet weak var favoriteNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentContact = favoritesList[myIndex]
        favoriteContact.text = "\(currentContact.firstName) \(currentContact.lastName)"
        favoriteNumber.text = currentContact.phoneNumber
    }
    
}

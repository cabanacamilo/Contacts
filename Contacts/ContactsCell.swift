//
//  ContactsCell.swift
//  Contacts
//
//  Created by Camilo Cabana on 2/20/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class ContactsCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var addFavotiteContactButton: UIButton!
    
    var link: ViewContatcsController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addFavotiteContactButton.addTarget(self, action: #selector(marckFavorite), for: .touchUpInside)
    }
    
    @objc func marckFavorite(){
        link?.callFromCell(cell: self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  HeaderCollectionViewCell.swift
//  Appstore
//
//  Created by Woody on 2022/06/04.
//

import UIKit

class HeaderCollectionViewCell: BaseCollectionViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func attribute() {
        super.attribute()
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        profileImageView.backgroundColor = .magenta
    }
}

//
//  ContentCollectionViewCell.swift
//  Appstore
//
//  Created by Woody on 2022/06/05.
//

import UIKit

class ContentCollectionViewCell: BaseCollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    override func attribute() {
        super.attribute()
        containerView.layer.cornerRadius = 12
        containerView.layer.masksToBounds = true
        containerView.backgroundColor = .red
    }
}

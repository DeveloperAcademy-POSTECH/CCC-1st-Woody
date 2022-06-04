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
        containerView.addRadius(12) 
        containerView.setBackgroundColor(.red)
        containerView.addShadow(color: .black.withAlphaComponent(0.4),
                                opacity: 0.4,
                                offset: .init(width: 0, height: 3),
                                radius: 10)
    }
}

//
//  ContentCollectionViewCell.swift
//  Appstore
//
//  Created by Woody on 2022/06/05.
//

import UIKit

final class ContentCollectionViewCell: BaseCollectionViewCellWithNib {
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet var appViews: [UIView]!
    
    override func attribute() {
        super.attribute()
        containerView.addRadius(12)
        containerView.layer.masksToBounds = true
        containerView.setBackgroundColor(.red)
        shadowView.addRadius(12)
        shadowView.addShadow(color: .black.withAlphaComponent(0.4),
                                opacity: 0.4,
                                offset: .init(width: 0, height: 3),
                                radius: 10)
        appViews.forEach {
            $0.addRadius(15)
            $0.addBorder(.gray, 0.5)
        }
        
    }
}

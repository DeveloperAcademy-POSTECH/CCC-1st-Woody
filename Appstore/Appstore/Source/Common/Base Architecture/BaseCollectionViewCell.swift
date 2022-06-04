//
//  BaseCollectionViewCell.swift
//  Appstore
//
//  Created by Woody on 2022/06/04.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell, CodeBasedView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        attribute()
        layout()
    }
    func attribute() { }
    
    func layout() { }
    
}

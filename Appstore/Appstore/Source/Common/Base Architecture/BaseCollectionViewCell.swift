//
//  BaseCollectionViewCell.swift
//  Appstore
//
//  Created by Woody on 2022/06/04.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell, CodeBasedView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func attribute() { }
    
    func layout() { }
}

class BaseCollectionViewCellWithNib: UICollectionViewCell, CodeBasedView {
    override func awakeFromNib() {
        super.awakeFromNib()
        attribute()
        layout()
    }
    
    func attribute() { }
    
    func layout() { }
}

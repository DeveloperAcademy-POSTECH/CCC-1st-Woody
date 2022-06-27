//
//  CodeBasedCollectionViewCell.swift
//  Appstore
//
//  Created by Woody on 2022/06/25.
//

import UIKit

class CodeBasedCollectionViewCell: UICollectionViewCell, CodeBasedView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func attribute() { }
    
    func layout() { }
    
}

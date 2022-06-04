//
//  UIStackView+.swift
//  Appstore
//
//  Created by Woody on 2022/06/04.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
    
}

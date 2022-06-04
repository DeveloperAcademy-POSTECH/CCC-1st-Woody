//
//  UIView+.swift
//  Appstore
//
//  Created by Woody on 2022/06/04.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}

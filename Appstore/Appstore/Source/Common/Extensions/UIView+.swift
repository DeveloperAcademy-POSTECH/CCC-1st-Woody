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
    
    func addRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = 12
    }
    
    func addBorder(
        _ color: UIColor,
        _ width: CGFloat
    ) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    func setBackgroundColor(_ color: UIColor) {
        self.backgroundColor = color
    }
    
    func addShadow(
        color: UIColor,
        opacity: Float,
        offset: CGSize,
        radius: CGFloat
    ) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
    }
}

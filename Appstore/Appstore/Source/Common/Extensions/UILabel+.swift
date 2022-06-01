//
//  UILabel+.swift
//  Appstore
//
//  Created by Woody on 2022/06/02.
//

import UIKit

extension UILabel {
    
    func setupLineSpacing(
        _ height: CGFloat,
        alignment: NSTextAlignment = .left
    ) {
        let attrString = NSMutableAttributedString(string: self.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = height
        paragraphStyle.alignment = alignment
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                value: paragraphStyle,
                                range: NSRange(location: 0, length: attrString.length))
        self.attributedText = attrString
    }
}

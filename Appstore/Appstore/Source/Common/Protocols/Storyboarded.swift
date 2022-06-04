// Meetu Repository
//
//  Storyboarded.swift
//  Appstore
//
//  Created by Woody on 2022/06/04.
//

import UIKit

protocol Storyboarded: UIViewController {
    static func instantiate() -> Self
}
extension Storyboarded {
    static func instantiate() -> Self {
        let storyboardName = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateInitialViewController() as! Self
    }
}

//
//  UIViewController+.swift
//  Appstore
//
//  Created by Woody on 2022/06/02.
//

import UIKit

extension UIViewController {
    
    func wrappedByNavigationController() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: self)
        navigationController.interactivePopGestureRecognizer?.delegate = nil
        navigationController.isNavigationBarHidden = true
        return navigationController
    }
    
    func instantiate() -> Self {
        let storyboardName = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateInitialViewController() as! Self
    }
}

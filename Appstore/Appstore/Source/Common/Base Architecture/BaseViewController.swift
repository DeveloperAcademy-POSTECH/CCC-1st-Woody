//
//  BaseViewController.swift
//  Appstore
//
//  Created by Woody on 2022/06/02.
//

import UIKit

class BaseViewController: UIViewController, CodeBasedView {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
    }
    
    func attribute() { }
    
    func layout() { }
    
}

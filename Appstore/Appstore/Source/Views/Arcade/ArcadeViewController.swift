//
//  ArcadeViewController.swift
//  Appstore
//
//  Created by Woody on 2022/06/02.
//

import UIKit

final class ArcadeViewController: BaseViewController {
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func attribute() {
        super.attribute()
        setupLabel()
    }
    
    private func setupLabel() {
        label.text = "아케이드"
    }
    
    override func layout() {
        super.layout()
        
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalTo(self.view.snp.center)
        }
    }
}

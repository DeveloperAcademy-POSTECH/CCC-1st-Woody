//
//  GameViewController.swift
//  Appstore
//
//  Created by Woody on 2022/06/02.
//

import UIKit

final class GameViewController: BaseViewController, Storyboarded {
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
        label.text = "게임"
    }
    
    override func layout() {
        super.layout()
        
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalTo(self.view.snp.center)
        }
    }
}

//
//  HeaderCollectionViewCell.swift
//  Appstore
//
//  Created by Woody on 2022/06/05.
//

import UIKit

final class GameHeaderCollectionViewCell: BaseCollectionViewCell {
    private let divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func attribute() {
        super.attribute()
        divider.backgroundColor = .systemGray4
        titleLabel.text = "무료 게임 순위"
        titleLabel.font = .systemFont(ofSize: 20, weight: .black)
        button.setTitle("모두 보기", for: .normal)
    }
    
    override func layout() {
        super.layout()
        self.contentView.addSubViews(divider, titleLabel, button)
        divider.snp.makeConstraints {
            $0.top.equalTo(self).offset(10)
            $0.leading.equalTo(self.contentView.snp.leading).offset(16)
            $0.trailing.equalTo(self.contentView.snp.trailing).inset(16)
            $0.height.equalTo(0.5)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.divider.snp.top).offset(10)
            $0.leading.equalTo(self.contentView.snp.leading).offset(16)
        }
        button.snp.makeConstraints {
            $0.centerY.equalTo(self.titleLabel.snp.centerY)
            $0.trailing.equalTo(self.contentView.snp.trailing).inset(24)
        }
    }
}

//
//  TodayType1Cell.swift
//  Appstore
//
//  Created by Woody on 2022/06/25.
//

import UIKit

final class TodayType1Cell: CodeBasedCollectionViewCell {
    
    private let imageView: UIImageView = {
        $0.image = UIImage(named: "tomorrow")
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    private let stackView: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.spacing = 4
        return $0
    }(UIStackView())
    
    private let subTitleLabel: UILabel = {
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.textColor = .white.withAlphaComponent(0.7)
        $0.text = TodayType1Cell.subTitle
        $0.setContentCompressionResistancePriority(.required, for: .horizontal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let titleLabel: UILabel = {
        $0.font = .systemFont(ofSize: 30, weight: .black)
        $0.textColor = .white
        $0.text = TodayType1Cell.title
        $0.setContentCompressionResistancePriority(.required, for: .horizontal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let bottomLabel: UILabel = {
        $0.font = .systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .white
        $0.text = TodayType1Cell.bottomText
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    // MARK: Layout
    
    override func layout() {
        super.layout()
         
        self.contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.leading.top.trailing.bottom.equalToSuperview()
        }
        
        self.contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(16)
        }
        
        stackView.addArrangedSubviews(subTitleLabel, titleLabel)
        
        self.contentView.addSubview(bottomLabel)
        bottomLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
}

extension TodayType1Cell {
    static let title: String = "웹툰이 살아났다! - 4편"
    static let subTitle: String = "같이 즐겨요."
    static let bottomText: String = "웹툰과 드라마로 만나는 『내일』."
}

#if DEBUG
import SwiftUI

struct TodayType1CellRepresentable: UIViewRepresentable {
    typealias UIViewType = TodayType1Cell
    
    func makeUIView(context: Context) -> TodayType1Cell {
        TodayType1Cell()
    }
    
    func updateUIView(_ uiView: TodayType1Cell, context: Context) {
        
    }
}

struct TodayType1CellPreviews: PreviewProvider {
    static var previews: some View {
        TodayType1CellRepresentable()
            .frame(width: 368, height: 500)
            .previewLayout(.sizeThatFits)
    }
}
#endif

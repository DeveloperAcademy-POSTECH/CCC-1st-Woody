//
//  TodayHeaderCell.swift
//  Appstore
//
//  Created by Woody on 2022/06/28.
//

import UIKit

final class TodayHeaderCell: CodeBasedCollectionViewCell {
    
    private let imageView: UIImageView = {
        $0.image = UIImage(named: TodayHeaderCell.imageName)
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .black
        return $0
    }(UIImageView())
   
    private let stackView: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.spacing = 0
        return $0
    }(UIStackView())
    
    private let subTitleLabel: UILabel = {
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .darkGray
        $0.text = TodayHeaderCell.subTitle
        $0.setContentCompressionResistancePriority(.required, for: .horizontal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let titleLabel: UILabel = {
        $0.font = .systemFont(ofSize: 32, weight: .black)
        $0.textColor = .black
        $0.text = TodayHeaderCell.title
        $0.setContentCompressionResistancePriority(.required, for: .horizontal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    override func attribute() {
        super.attribute()
        imageView.addRadius(TodayHeaderCell.imageViewHeight / 2)
    }
    override func layout() {
        super.layout()
        
        self.contentView.addSubview(stackView)
        stackView.addArrangedSubviews(subTitleLabel, titleLabel)
        stackView.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
        }
        
        self.contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.height.width.equalTo(TodayHeaderCell.imageViewHeight)
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(self.titleLabel)
        }
        
    }
}

extension TodayHeaderCell {
    static let title: String = "투데이"
    static let subTitle: String = "6월 28일 목요일"
    static let imageName: String = "woody"
    
    static let imageViewHeight: CGFloat = 36
}

#if DEBUG
import SwiftUI

struct TodayHeaderCellRepresentable: UIViewRepresentable {
    typealias UIViewType = TodayHeaderCell
    
    func makeUIView(context: Context) -> TodayHeaderCell {
        return TodayHeaderCell()
    }
    
    func updateUIView(_ uiView: TodayHeaderCell, context: Context) {
        
    }
}

struct TodayHeaderCellPreviews: PreviewProvider {
    static var previews: some View {
        TodayHeaderCellRepresentable()
            .frame(width: 368, height: 60)
            .previewLayout(.sizeThatFits)
    }
}
#endif

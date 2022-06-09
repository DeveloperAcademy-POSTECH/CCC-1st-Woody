//
//  GameListCollectionViewCell.swift
//  Appstore
//
//  Created by Woody on 2022/06/05.
//

import UIKit

final class GameListCollectionViewCell: BaseCollectionViewCell {
    weak var parentController: UIViewController?
    static let width: CGFloat = DeviceInfo.width - 32
    static let minimumLineSpacing: CGFloat = 13
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return collectionView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(HostingCollectionViewCell<AppDownloadViews>.self)
        contentView.addSubViews(collectionView)
        collectionView.snp.makeConstraints {
            $0.leading.top.trailing.bottom.equalTo(self.contentView)
            let height: CGFloat = AppDownloadViews.spacing * 4 + AppDownloadView.cellHeight * 3 + 16
            $0.height.equalTo(height)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: UICollectionViewDataSource
extension GameListCollectionViewCell: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 5
    }
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(HostingCollectionViewCell<AppDownloadViews>.self,
                                                            for: indexPath)
        else { fatalError() }
        cell.host(AppDownloadViews(), parent: parentController!)
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension GameListCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width: CGFloat  = GameListCollectionViewCell.width
        let height: CGFloat = AppDownloadViews.spacing * 4 + AppDownloadView.cellHeight * 3 + 16 // TODO: 반응형으로 맞추기
        return .init(width: width, height: height)
    }
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return GameListCollectionViewCell.minimumLineSpacing
    }
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 0
    }
}

extension GameListCollectionViewCell: UICollectionViewDelegate {
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        let inset: CGFloat = DeviceInfo.width - GameListCollectionViewCell.width
        let width: CGFloat = DeviceInfo.width - inset
        
        let cellWidthIncludingSpacing = width + GameListCollectionViewCell.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        var roundedIndex = round(index)
        
        if scrollView.contentOffset.x > targetContentOffset.pointee.x {
            roundedIndex = floor(index)
        } else {
            roundedIndex = ceil(index)
        }
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}

//
//  GameTopCollectionViewCell.swift
//  Appstore
//
//  Created by Woody on 2022/06/08.
//

import UIKit

class GameTopCollectionViewCell: BaseCollectionViewCell {
    weak var parentController: UIViewController?
    static let width: CGFloat = DeviceInfo.width - 32
    static let minimumLineSpacing: CGFloat = 9
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
        return collectionView
    }()
    
    override func attribute() {
        super.attribute()
        collectionView.register(HostingCollectionViewCell<CurrentProgressAppView>.self)
    }
    
    override func layout() {
        super.layout()
        contentView.addSubViews(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalTo(self.contentView)
            $0.leading.trailing.equalTo(self.contentView)
            let height: CGFloat = DeviceInfo.width * 4 / 3.5
            $0.height.equalTo(height)
        }
    }
}

// MARK: UICollectionViewDataSource
extension GameTopCollectionViewCell: UICollectionViewDataSource {
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
        guard let cell = collectionView.dequeueReusableCell(HostingCollectionViewCell<CurrentProgressAppView>.self,
                                                            for: indexPath)
        else { fatalError() }
        cell.host(CurrentProgressAppView(), parent: parentController!)
        cell.addRadius(10)
        cell.layer.masksToBounds = true
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension GameTopCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width: CGFloat  = GameTopCollectionViewCell.width
        let height: CGFloat = DeviceInfo.width * 4 / 3.5
        return .init(width: width, height: height)
    }
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return GameTopCollectionViewCell.minimumLineSpacing
    }
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 0
    }
}

extension GameTopCollectionViewCell: UICollectionViewDelegate {
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        let inset: CGFloat = DeviceInfo.width - GameTopCollectionViewCell.width
        let width: CGFloat = DeviceInfo.width - inset
        
        let cellWidthIncludingSpacing = width + GameTopCollectionViewCell.minimumLineSpacing
        
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

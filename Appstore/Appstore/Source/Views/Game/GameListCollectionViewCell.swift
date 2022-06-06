//
//  GameListCollectionViewCell.swift
//  Appstore
//
//  Created by Woody on 2022/06/05.
//

import UIKit

final class GameListCollectionViewCell: BaseCollectionViewCell {
    weak var parentController: UIViewController?
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(AppDownloadsCollectionViewCell<AppDownloadViews>.self)
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
        guard let cell = collectionView.dequeueReusableCell(AppDownloadsCollectionViewCell<AppDownloadViews>.self,
                                                            for: indexPath)
        else { fatalError() }
        cell.host(AppDownloadViews(), parent: parentController!)
        return cell
    }
    
}

extension GameListCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width: CGFloat  = DeviceInfo.width - 16 * 2
        let height: CGFloat = AppDownloadViews.spacing * 4 + AppDownloadView.cellHeight * 3 + 16
        return .init(width: width, height: height)
    }
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 0
    }
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 0
    }
}

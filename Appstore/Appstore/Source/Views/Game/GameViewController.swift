// https://stackoverflow.com/questions/47062176/image-for-navigation-bar-with-large-title-ios-11
//  GameViewController.swift
//  Appstore
//
//  Created by Woody on 2022/06/02.
//

import UIKit

final class GameViewController: BaseViewController, Storyboarded {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let imageView: UIImageView = {
        let image = UIImage(named: "photo")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private enum Section: Int {
        case nowProgress
        case freeGameRanking
        case iPhoneGame
        case popularGame
        case gameRecommend
        
        static func count() -> Int {
            return Section.gameRecommend.rawValue + 1
        }
    }
    
    override func attribute() {
        super.attribute()
        self.title = "게임"
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(GameTopCollectionViewCell.self)
        collectionView.register(GameHeaderCollectionViewCell.self)
        collectionView.register(GameListCollectionViewCell.self)
        imageView.backgroundColor = .black
        imageView.addRadius(40)
    }
}

// MARK: UICollectionViewDataSource
extension GameViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.count()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        guard let section = Section(rawValue: section) else { fatalError() }
        switch section {
        case .nowProgress:
            return 1
        default:
            return 2
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        switch section {
        case .nowProgress:
            return gameTopCollectionViewCell(for: indexPath)
        default:
            if indexPath.row == 0 {
                return gameHeaderCollectionViewCell(for: indexPath)
            } else {
                return gameListCollectionViewCell(for: indexPath)
            }
        }
    }
    
    private func gameTopCollectionViewCell(
        for indexPath: IndexPath
    ) -> GameTopCollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(GameTopCollectionViewCell.self,
                                                            for: indexPath)
        else { fatalError() }
        cell.parentController = self
        return cell
    }
    
    private func gameHeaderCollectionViewCell(
        for indexPath: IndexPath
    ) -> GameHeaderCollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(GameHeaderCollectionViewCell.self,
                                                            for: indexPath)
        else { fatalError() }
        
        return cell
    }
    
    private func gameListCollectionViewCell(
        for indexPath: IndexPath
    ) -> GameListCollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(GameListCollectionViewCell.self,
                                                            for: indexPath)
        else { fatalError() }
        cell.parentController = self
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension GameViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        guard let section = Section(rawValue: indexPath.section)
        else { fatalError() }
        switch section {
        case .nowProgress:
            let height: CGFloat = CurrentProgressAppView.imageSize.height + 100
            return .init(width: DeviceInfo.width, height: height)
        default:
            if indexPath.row == 0 {
                return .init(width: DeviceInfo.width, height: 48)
            } else {
                let height: CGFloat = AppDownloadViews.spacing * 4 + AppDownloadView.cellHeight * 3
                return .init(width: DeviceInfo.width, height: height)
            }
        }
    }
}

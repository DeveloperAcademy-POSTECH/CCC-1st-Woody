//
//  TodayViewController.swift
//  Appstore
//
//  Created by Woody on 2022/06/02.
//

import UIKit
import SnapKit

final class TodayViewController: BaseViewController, Storyboarded {
    @IBOutlet weak var collectionView: UICollectionView!
        
    private let contents: [String] = ["", "", "", "", "", "", "", "", "", "", "", "", ""]
    
    override func attribute() {
        super.attribute()
        
        collectionView.registerWithNib(HeaderCollectionViewCell.self)
        collectionView.registerWithNib(ContentCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
   
    override func layout() {
        super.layout()
        
    }
}

extension TodayViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 6
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        if indexPath.row == 0 {
            return createHeaderCollectionViewCell(for: indexPath)
        } else {
            return createContentCollectionViewCell(for: indexPath)
        }
    }
    
    private func createHeaderCollectionViewCell(
        for indexPath: IndexPath
    ) -> HeaderCollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(HeaderCollectionViewCell.self,
                                                            for: indexPath)
        else { fatalError() }
        
        return cell
    }
    
    private func createContentCollectionViewCell(
        for indexPath: IndexPath
    ) -> ContentCollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(ContentCollectionViewCell.self,
                                                            for: indexPath)
        else { fatalError() }
        cell.layer.masksToBounds = false
        return cell
    }
}

extension TodayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: DeviceInfo.width, height: 80)
        } else {
            return CGSize(width: DeviceInfo.width, height: 450)
        }
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

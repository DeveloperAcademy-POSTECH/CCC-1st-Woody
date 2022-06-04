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
    
    override func attribute() {
        super.attribute()
        
        collectionView.backgroundColor = .white
        collectionView.registerWithNib(HeaderCollectionViewCell.self)
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
        return 1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(HeaderCollectionViewCell.self,
                                                            for: indexPath)
        else { fatalError() }
        return cell
    }
}

extension TodayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: DeviceInfo.width, height: 1000)
    }
}

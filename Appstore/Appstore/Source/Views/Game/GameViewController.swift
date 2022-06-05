//
//  GameViewController.swift
//  Appstore
//
//  Created by Woody on 2022/06/02.
//

import UIKit

final class GameViewController: BaseViewController, Storyboarded {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func attribute() {
        super.attribute()
        self.title = "게임"
        
    }
    
    override func layout() {
        super.layout()
        
    }
}

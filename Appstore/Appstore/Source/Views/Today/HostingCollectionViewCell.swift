//
// https://stackoverflow.com/questions/57616494/how-to-use-a-swiftui-view-in-place-of-table-view-cell
//
//  AppDownloadsCollectionViewCell.swift
//  Appstore
//
//  Created by Woody on 2022/06/05.
//

import UIKit
import SwiftUI
import SnapKit

class HostingCollectionViewCell<Content: View>: BaseCollectionViewCell {
    private weak var hostingController: UIHostingController<Content>?
    func host(_ view: Content, parent: UIViewController) {
        if let hostingController = hostingController {
            hostingController.rootView = view
        } else {
            let newHostingController = UIHostingController(rootView: view)
            hostingController = newHostingController
            newHostingController.view.backgroundColor = .clear
            
            layoutIfNeeded()
            
            parent.addChild(newHostingController)
            contentView.addSubViews(newHostingController.view)
            
            newHostingController.view.translatesAutoresizingMaskIntoConstraints = false
            newHostingController.view.snp.makeConstraints {
                $0.leading.equalTo(self.contentView)
                $0.trailing.equalTo(self.contentView)
                $0.top.equalTo(self.contentView)
                $0.bottom.equalTo(self.contentView)
            }
        }
    }
}
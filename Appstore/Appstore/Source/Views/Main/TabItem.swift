//
//  TabItem.swift
//  Appstore
//
//  Created by Woody on 2022/06/02.
//

import UIKit

enum TabItem: String {
    case today = "투데이"
    case game = "게임"
    case app = "앱"
    case arcade = "Arcade"
    case search = "검색"
    
    var title: String {
        return self.rawValue
    }
    
    var image: UIImage? {
        switch self {
        case .today:
            return .init(systemName: "doc.text.image")
        case .game:
            return .init(systemName: "car")
        case .app:
            return .init(systemName: "square.stack.3d.up.fill")
        case .arcade:
            return .init(systemName: "gamecontroller.fill")
        case .search:
            return .init(systemName: "magnifyingglass")
        }
    }
}

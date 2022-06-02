//
//  MainTabBarController.swift
//  Appstore
//
//  Created by Woody on 2022/06/02.
//

import UIKit

final class MainTabBarController: UITabBarController, CodeBasedView {
    private let todayViewController: UINavigationController = {
        let todayViewController = TodayViewController()
        let navigationController = UINavigationController(rootViewController: todayViewController)
        return navigationController
    }()
    private let gameViewController: UINavigationController = {
        let gameViewController = GameViewController()
        let navigationController = UINavigationController(rootViewController: gameViewController)
        return navigationController
    }()
    private let appViewController: UINavigationController = {
        let appViewController = AppViewController()
        let navigationController = UINavigationController(rootViewController: appViewController)
        return navigationController
    }()
    private let acadeViewController: UINavigationController = {
        let arcadeViewController = ArcadeViewController()
        let navigationController = UINavigationController(rootViewController: arcadeViewController)
        return navigationController
    }()
    private let searchViewController: UINavigationController = {
        let searchViewController = SearchViewController()
        let navigationController = UINavigationController(rootViewController: searchViewController)
        return navigationController
    }()
    private let tabItems: [TabItem] = [.today, .game, .app, .arcade, .search]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
    }
    
    func attribute() {
        tabBar.barTintColor = .white
        tabBar.backgroundColor = .white
        
        let viewControllers = [todayViewController, gameViewController, appViewController, acadeViewController, searchViewController]
        viewControllers
            .enumerated()
            .forEach {
            $0.element.tabBarItem = UITabBarItem(title: tabItems[$0.offset].rawValue,
                                                 image: tabItems[$0.offset].image,
                                                 selectedImage: nil)
        }
        setViewControllers(viewControllers, animated: false)
    }
    
    func layout() { }
    
}

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

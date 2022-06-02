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
        return todayViewController.wrappedByNavigationController()
    }()
    private let gameViewController: UINavigationController = {
        let gameViewController = GameViewController()
        return gameViewController.wrappedByNavigationController()
    }()
    private let appViewController: UINavigationController = {
        let appViewController = AppViewController()
        return appViewController.wrappedByNavigationController()
    }()
    private let acadeViewController: UINavigationController = {
        let arcadeViewController = ArcadeViewController()
        return arcadeViewController.wrappedByNavigationController()
    }()
    private let searchViewController: UINavigationController = {
        let searchViewController = SearchViewController()
        return searchViewController.wrappedByNavigationController()
    }()
    private let tabItems: [TabItem] = [.today, .game, .app, .arcade, .search]
    private lazy var viewControllersToShow = [todayViewController, gameViewController, appViewController, acadeViewController, searchViewController]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
    }
    
    func attribute() {
        viewControllersToShow.enumerated().forEach {
            $0.element.tabBarItem = setupTabBarItems(index: $0.offset)
        }
        setupViewControllers()
    }
    
    private func setupTabBarItems(index: Int) -> UITabBarItem {
        return UITabBarItem(title: tabItems[index].rawValue,
                            image: tabItems[index].image,
                            selectedImage: nil)
    }
    
    private func setupViewControllers() {
        setViewControllers(viewControllersToShow, animated: false)
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

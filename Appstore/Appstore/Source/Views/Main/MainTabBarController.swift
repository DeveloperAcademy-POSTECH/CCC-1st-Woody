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
        return UINavigationController()
    }()
    
    private let searchViewController: UINavigationController = {
        return UINavigationController()
    }()
    
    private let todayTabBarItem = UITabBarItem(title: "투데이", image: nil, selectedImage: nil)
    
    private let gameTabBarItem = UITabBarItem(title: "게임", image: nil, selectedImage: nil)
    private let appTabBarItem = UITabBarItem(title: "앱", image: nil, selectedImage: nil)
    private let acadeTabBarItem = UITabBarItem(title: "Arcade", image: nil, selectedImage: nil)
    private let searchTabBarItem = UITabBarItem(title: "검색", image: nil, selectedImage: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
    }
    
    func attribute() {
        tabBar.barTintColor = .white
        tabBar.backgroundColor = .white
        
        todayViewController.tabBarItem = todayTabBarItem
        gameViewController.tabBarItem = gameTabBarItem
        appViewController.tabBarItem = appTabBarItem
        acadeViewController.tabBarItem = acadeTabBarItem
        searchViewController.tabBarItem = searchTabBarItem
        
        setViewControllers([todayViewController, gameViewController, appViewController, acadeViewController, searchViewController], animated: false)
    }
    
    func layout() { }
    
}

enum TabItem {
    case today
    case game
    case app
    case arcade
    case search
    
}

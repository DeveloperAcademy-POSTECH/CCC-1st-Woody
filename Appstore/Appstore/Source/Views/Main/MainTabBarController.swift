//
//  MainTabBarController.swift
//  Appstore
//
//  Created by Woody on 2022/06/02.
//

import UIKit

final class MainTabBarController: UITabBarController {
    private let todayViewController: UINavigationController = {
        let todayViewController = TodayViewController.instantiate()
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
    }
}

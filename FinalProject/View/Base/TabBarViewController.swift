//
//  BaseTabBarViewController.swift
//  FinalProject
//
//  Created by PCI0001 on 9/14/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class TabBarViewController: UITabBarController {

    // MARK: - Properties
    private var statsNavi = UINavigationController(rootViewController: StatsViewController())
    private var searchNavi = UINavigationController(rootViewController: SearchViewController())
    private var mapNavi = UINavigationController(rootViewController: MapViewController())
    private var followNavi = UINavigationController(rootViewController: FollowViewController())

    enum TabBar: Int {
        case stats = 0
        case search = 1
        case follow = 2

        var title: String {
            switch self {
            case .stats:
                return "Stats"
            case .search:
                return "Search"
            case .follow:
                return "Follow"
            }
        }
        var image: String {
            switch self {
            case .stats:
                return "icon1"
            case .search:
                return "icon2"
            case .follow:
                return "icon4"
            }
        }
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewController()
        configTabBar()
    }

    // MARK: - Private methods
    private func configViewController() {
        statsNavi.tabBarItem = UITabBarItem(title: TabBar.stats.title, image: UIImage(named: TabBar.stats.image), tag: TabBar.stats.rawValue)
        searchNavi.tabBarItem = UITabBarItem(title: TabBar.search.title, image: UIImage(named: TabBar.search.image), tag: TabBar.search.rawValue)
        followNavi.tabBarItem = UITabBarItem(title: TabBar.follow.title, image: UIImage(named: TabBar.follow.image), tag: TabBar.follow.rawValue)

        setViewControllers([statsNavi, searchNavi, followNavi], animated: false)
    }

    private func configTabBar() {
        tabBar.tintColor = .black
        tabBar.isTranslucent = false
        tabBar.clipsToBounds = true
    }
}

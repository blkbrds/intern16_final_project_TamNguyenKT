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
        case map = 2
        case follow = 3

        var title: String {
            switch self {
            case .stats:
                return "Stats"
            case .search:
                return "Search"
            case .map:
                return "Map"
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
            case .map:
                return "icon3"
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
        mapNavi.tabBarItem = UITabBarItem(title: TabBar.map.title, image: UIImage(named: TabBar.map.image), tag: TabBar.map.rawValue)
        followNavi.tabBarItem = UITabBarItem(title: TabBar.follow.title, image: UIImage(named: TabBar.follow.image), tag: TabBar.follow.rawValue)

        setViewControllers([statsNavi, searchNavi, mapNavi, followNavi], animated: false)
    }

    private func configTabBar() {
        tabBar.tintColor = .black
        tabBar.backgroundColor = App.Color.tabBarBackgroundColor
    }
}

//
//  BaseTabBarViewController.swift
//  FinalProject
//
//  Created by PCI0001 on 9/14/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class BaseTabBarViewController: UITabBarController {
    
    // MARK: - Properties
    private var statsNavi = UINavigationController(rootViewController: StatsViewController())
    private var searchNavi = UINavigationController(rootViewController: SearchViewController())
    private var mapNavi = UINavigationController(rootViewController: MapViewController())
    private var followNavi = UINavigationController(rootViewController: FollowViewController())
    
    enum Title: String {
        case stats = "Stats"
        case search = "Search"
        case map = "Map"
        case follow = "Follow"
    }
    
    enum ImageTabBar: String {
        case stats = "icon1"
        case search = "icon2"
        case map = "icon3"
        case follow = "icon4"
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewController()
        configTabBar()
    }
    
    // MARK: - Private methods
    private func configViewController() {
        statsNavi.tabBarItem = UITabBarItem(title: Title.stats.rawValue, image: UIImage(named: ImageTabBar.stats.rawValue), tag: 0)
        searchNavi.tabBarItem = UITabBarItem(title: Title.search.rawValue, image: UIImage(named: ImageTabBar.search.rawValue), tag: 1)
        mapNavi.tabBarItem = UITabBarItem(title: Title.map.rawValue, image: UIImage(named: ImageTabBar.map.rawValue), tag: 2)
        followNavi.tabBarItem = UITabBarItem(title: Title.follow.rawValue, image: UIImage(named: ImageTabBar.follow.rawValue), tag: 3)
        
        setViewControllers([statsNavi, searchNavi, mapNavi, followNavi], animated: false)
    }
    
    private func configTabBar() {
        tabBar.tintColor = .black
        tabBar.backgroundColor = App.Color.tabBarBackgroundColor
    }
}

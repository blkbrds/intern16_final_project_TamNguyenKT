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
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewController()
        configTabBar()
    }
    
    // MARK: - Private methods
    private func configViewController() {
        statsNavi.tabBarItem = UITabBarItem(title: "Stats", image: #imageLiteral(resourceName: "icons8-bar-chart-50.png"), tag: 0)
        searchNavi.tabBarItem = UITabBarItem(title: "Search", image: #imageLiteral(resourceName: "icons8-search-50.png"), tag: 1)
        mapNavi.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "icons8-map-50.png"), tag: 2)
        followNavi.tabBarItem = UITabBarItem(title: "Follow", image: #imageLiteral(resourceName: "icons8-latvia-country-50.png"), tag: 3)
        
        setViewControllers([statsNavi, searchNavi, mapNavi, followNavi], animated: false)
    }
    
    private func configTabBar() {
        tabBar.tintColor = .black
        tabBar.backgroundColor = UIColor(red: 255, green: 251, blue: 245, alpha: 1)
    }
}

//
//  TabBarController.swift
//  Codegen
//
//  Created by Mário Galvao on 18/07/20.
//  Copyright © 2020 Open Mind House. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    var searchViewController: UINavigationController {
        let icon = UIImage.init(systemName: "magnifyingglass")
        let item = UITabBarItem(title: "Search Pets", image: icon, tag: 0)
        let viewController = SearchViewController()
        viewController.tabBarItem = item
        let viewModel = SearchViewModel(viewControllerDelegate: viewController)
        viewController.viewModelDelegate = viewModel
        let navigationController = NavigationController()
        navigationController.viewControllers = [viewController]
        return navigationController
    }
    
    var addViewController: UINavigationController {
        let icon = UIImage.init(systemName: "plus.circle")
        let item = UITabBarItem(title: "Add Pet", image: icon, tag: 0)
        let viewController = AddViewController()
        viewController.tabBarItem = item
        let viewModel = AddViewModel(viewControllerDelegate: viewController)
        viewController.viewModelDelegate = viewModel
        let navigationController = NavigationController()
        navigationController.viewControllers = [viewController]
        return navigationController
    }
    
    var shoppingViewController: UINavigationController {
        let icon = UIImage.init(systemName: "cart")
        let item = UITabBarItem(title: "Orders", image: icon, tag: 0)
        let viewController = ShoppingViewController()
        viewController.tabBarItem = item
        let viewModel = ShoppingViewModel(viewControllerDelegate: viewController)
        viewController.viewModelDelegate = viewModel
        let navigationController = NavigationController()
        navigationController.viewControllers = [viewController]
        return navigationController
    }
    
    var profileViewController: UINavigationController {
        let icon = UIImage.init(systemName: "person.circle")
        let item = UITabBarItem(title: "Profile", image: icon, tag: 0)
        let viewController = ProfileViewController()
        viewController.tabBarItem = item
        let viewModel = ProfileViewModel(viewControllerDelegate: viewController)
        viewController.viewModelDelegate = viewModel
        let navigationController = NavigationController()
        navigationController.viewControllers = [viewController]
        return navigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [searchViewController, addViewController, shoppingViewController, profileViewController]
    }

}

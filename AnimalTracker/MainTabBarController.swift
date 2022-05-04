//
//  MainTabBarController.swift
//  AnimalTracker
//
//  Created by Askar on 03.05.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: CowListTableViewController())
        let vc2 = UINavigationController(rootViewController: MapViewController())
        
        tabBar.tintColor = .label
        tabBar.backgroundColor = .systemBackground
        
        vc1.tabBarItem.image = UIImage(systemName: "list.bullet")
        vc2.tabBarItem.image = UIImage(systemName: "mappin.circle")
        
        vc1.title = "Cows"
        vc2.title = "Map"
        setViewControllers([vc1, vc2], animated: true)
    }

}

//
//  MyTabBarController.swift
//  Submission Dicoding Fundamental
//
//  Created by Ilham Wibowo on 10/06/22.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstViewController = UINavigationController(rootViewController: HomeViewController())
//        let secondViewController = UINavigationController(rootViewController: SearchViewController())
        let secondViewController = UINavigationController(rootViewController: CreatorViewController())
        let thirdViewController = UINavigationController(rootViewController: ProfileViewController())
        
        firstViewController.tabBarItem = UITabBarItem(title: "Home", image: .actions, tag: 0)
        secondViewController.tabBarItem = UITabBarItem(title: "Creator", image: .actions, tag: 1)
        thirdViewController.tabBarItem = UITabBarItem(title: "Profile", image: .actions, tag: 2)
        
        viewControllers = [firstViewController,secondViewController,thirdViewController]
        // Do any additional setup after loading the view.
    }

}

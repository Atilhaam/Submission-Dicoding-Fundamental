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
        let secondViewController = UINavigationController(rootViewController: SearchViewController())
        let thirdViewController = UINavigationController(rootViewController: CreatorViewController())
        
        firstViewController.tabBarItem = UITabBarItem(title: "Home", image: .actions, tag: 0)
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        thirdViewController.tabBarItem = UITabBarItem(title: "Creator", image: .actions, tag: 2)
        
        viewControllers = [firstViewController,secondViewController,thirdViewController]
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  BaseTabbarController.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import UIKit

class BaseTabBarController: UITabBarController {
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		viewControllers = [
			createNavController(viewController: HomeViewController(), title: "Home", imageName: "home"),
			createNavController(viewController: UIViewController(), title: "Account", imageName: "account")
		]
	}
}

extension BaseTabBarController {
	fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
		let navController = UINavigationController(rootViewController: viewController)
		navController.navigationBar.prefersLargeTitles = true
		viewController.navigationItem.title = title
		navController.tabBarItem.title = title
		navController.tabBarItem.image = UIImage(named: imageName)
		return navController
	}
}

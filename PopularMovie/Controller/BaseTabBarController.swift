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
			createNavController(viewController: HomePageController(), title: "Movve", tabbarTitle: "Home", imageName: "home"),
			createNavController(viewController: UIViewController(), title: "Account", tabbarTitle: "Account", imageName: "account")
		]
	}
}

extension BaseTabBarController {
	fileprivate func createNavController(viewController: UIViewController, title: String,tabbarTitle: String, imageName: String) -> UIViewController {
		let navController = UINavigationController(rootViewController: viewController)
		navController.navigationBar.prefersLargeTitles = true
		navController.navigationBar.barStyle = .black
		viewController.navigationItem.title = title
		navController.tabBarItem.title = tabbarTitle
		navController.tabBarItem.image = UIImage(named: imageName)
		return navController
	}
}

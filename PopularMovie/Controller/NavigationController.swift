//
//  NavigationController.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import UIKit

class NavigationController: UINavigationController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		createNavController(viewController: MainViewController(), title: "Movve"
	}
	
	fileprivate func createNavController(viewController: UIViewController, title: String) -> UIViewController {
		let navController = UINavigationController(rootViewController: viewController)
		navController.navigationBar.prefersLargeTitles = true
		navController.navigationItem.title = title
		return navController
	}
}

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
		
		
		clearTabBar()
		createTabBar()
		setTabBarAppearance()
	}
	
	
	private func clearTabBar() {
		tabBar.backgroundImage = UIImage()
		tabBar.backgroundColor = .clear
		tabBar.shadowImage = UIImage()
	}
	
	
	private func createTabBar() {
		viewControllers = [
			createNavController(HomePageController(), title: "Movve", tabbarTitle: "Home", imageName: "house.fill"),
			createNavController(MediaPageController(), title: "Media", tabbarTitle: "Media", imageName: "film.fill"),
			createNavController(UIViewController(), title: "Search", tabbarTitle: "Search", imageName: "magnifyingglass"),
			createNavController(UIViewController(), title: "Account", tabbarTitle: "Account", imageName: "person.fill")
		]
	}
	
	
	private func createNavController(_ viewController: UIViewController, title: String,tabbarTitle: String, imageName: String) -> UIViewController {
		let navController = UINavigationController(rootViewController: viewController)
		
		navController.navigationBar.prefersLargeTitles = true
		navController.navigationBar.barStyle = .black
		viewController.navigationItem.title = title
		navController.tabBarItem.title = tabbarTitle
		navController.tabBarItem.image = UIImage(systemName: imageName)
		return navController
	}
	
	
	private func setTabBarAppearance() {
		let pozitionOnX: CGFloat = 8
		let pozitionOnY: CGFloat = 10
		let width = tabBar.bounds.width - pozitionOnX * 2
		let height = tabBar.bounds.height + pozitionOnY * 2
		
		
		let roundLayer = CAShapeLayer()
		let bezierPath = UIBezierPath(
			roundedRect: CGRect(x: pozitionOnX,
								y: tabBar.bounds.minY - pozitionOnY,
								width: width,
								height: height
							   ),
			cornerRadius: height / 2)
		roundLayer.path = bezierPath.cgPath
		
		
		tabBar.layer.insertSublayer(roundLayer, at: 0)
		tabBar.itemWidth = width / 7
		tabBar.itemPositioning = .centered
		
		
		roundLayer.fillColor = UIColor.tabBarColor.cgColor
		tabBar.isTranslucent = true
		tabBar.tintColor = UIColor.tabBarItemAccent
		tabBar.unselectedItemTintColor = UIColor.tabBarItemLight
	}
}

//
//  SceneDelegate.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 08.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	
	var window: UIWindow?
	
	func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(windowScene: windowScene)
        
		window?.windowScene = windowScene
		window?.makeKeyAndVisible()
		window?.rootViewController = BaseTabBarController()
	}
    
}


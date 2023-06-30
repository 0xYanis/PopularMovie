//
//  AppDelegate.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 08.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



	func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
		UINavigationBar.appearance().tintColor = .NavBarTextColor
		UINavigationBar.appearance().largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.NavBarTextColor
        ]
		UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.NavBarTextColor
        ]
        
		return true
	}

	// MARK: UISceneSession Lifecycle

	func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
		return UISceneConfiguration(
            name: "Default Configuration",
            sessionRole: connectingSceneSession.role
        )
	}
}


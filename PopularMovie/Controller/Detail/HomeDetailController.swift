//
//  HomeDetailController.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 11.02.2023.
//

import UIKit

class HomeDetailController: BaseController {
	
	
	fileprivate let filmId: Int
	fileprivate let posterId = "posterId"
	
	
	fileprivate var popularMovies: Page?
	fileprivate var tvGroup: TVGroup?
	fileprivate var timer: Timer?
	
	
	init(filmId: Int) {
		self.filmId = filmId
		super.init()
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		
		collectionView.contentInsetAdjustmentBehavior = .never
		collectionView.backgroundColor = UIColor(named: "background")
		collectionView.register(HomeDetailCell.self, forCellWithReuseIdentifier: posterId)
	}
	
	
	func hideTabbar(_ hidden: Bool) {
		timer?.invalidate()
		timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { _ in
			self.tabBarController?.tabBar.isHidden = hidden
		})
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setTabBarHidden(true)
		hideTabbar(true)
	}
	
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		setTabBarHidden(false)
		tabBarController?.tabBar.isHidden = false
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 1
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: posterId, for: indexPath) as! HomeDetailCell
		return cell
	}
}


extension HomeDetailController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return .init(width: view.frame.width, height: 500)
	}
}

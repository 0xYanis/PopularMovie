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
	fileprivate let labelId = "labelId"
	fileprivate let castId = "castId"
	
	
	fileprivate var popularMovies: DetailMovie?
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
		collectionView.backgroundColor = .black
		collectionView.showsVerticalScrollIndicator = false
		collectionView.register(HomePosterCell.self, forCellWithReuseIdentifier: posterId)
		collectionView.register(HomeLabelCell.self, forCellWithReuseIdentifier: labelId)
		
		
		fetchData()
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
	
	
	fileprivate func hideTabbar(_ hidden: Bool) {
		timer?.invalidate()
		timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { _ in
			self.tabBarController?.tabBar.isHidden = hidden
		})
	}
	
	
	fileprivate func fetchData() {
		let urlString = "https://kinopoiskapiunofficial.tech/api/v2.2/films/\(self.filmId)"
		Service.shared.fetchGenericJSONData(urlString) { (result: DetailMovie?, err) in
			let movie = result
			self.popularMovies = movie
			DispatchQueue.main.async {
				self.collectionView.reloadData()
			}
		}
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 2
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if indexPath.item == 0 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: posterId, for: indexPath) as! HomePosterCell
			cell.movie = popularMovies
			return cell
		} else {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: labelId, for: indexPath) as! HomeLabelCell
			cell.movie = popularMovies
			return cell
		}
	}
}


extension HomeDetailController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		if indexPath.item == 0 {
			return .init(width: view.frame.width, height: 370)
		} else {
			return .init(width: view.frame.width, height: 550)
		}
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return .zero
	}
}

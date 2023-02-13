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
	
	
	fileprivate var popularMovies: Film?
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
		
		
		collectionView.backgroundColor = UIColor(named: "background")
		collectionView.contentInsetAdjustmentBehavior = .never
		collectionView.register(HomePosterCell.self, forCellWithReuseIdentifier: posterId)
		collectionView.register(HomeLabelCell.self, forCellWithReuseIdentifier: labelId)
		collectionView.register(HomeCastCell.self, forCellWithReuseIdentifier: castId)
		
		
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
		Service.shared.fetchGenericJSONData(urlString) { (result: Page?, err) in
			let movie = result?.films.first
			self.popularMovies = movie
			DispatchQueue.main.async {
				self.collectionView.reloadData()
			}
		}
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if indexPath.item == 0 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: posterId, for: indexPath) as! HomePosterCell
			cell.imageView.loadImage(urlString: self.popularMovies?.posterUrl ?? "")
			return cell
		} else if indexPath.item == 1 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: labelId, for: indexPath) as! HomeLabelCell
			return cell
		} else {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: castId, for: indexPath) as! HomeCastCell
			return cell
		}
	}
}


extension HomeDetailController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		if indexPath.item == 0 {
			return .init(width: view.frame.width, height: 500)
		} else if indexPath.item == 1 {
			return .init(width: view.frame.width, height: 100)
		} else {
			return .init(width: view.frame.width, height: 200)
		}
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return .init(top: 0, left: 0, bottom: 15, right: 0)
	}
}

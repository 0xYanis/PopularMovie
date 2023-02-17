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
	fileprivate let controlId = "controlId"
	fileprivate let labelId = "labelId"

	
	
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
		collectionView.register(DetailPosterCell.self, forCellWithReuseIdentifier: posterId)
		collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: controlId)
		collectionView.register(DetailLabelCell.self, forCellWithReuseIdentifier: labelId)
		
		
		setupAddToFavoriteButton()
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
	
	
	fileprivate func setupAddToFavoriteButton() {
		let starImage = UIImage(systemName: "star.fill")
		let addToFavoriteButt = UIBarButtonItem(image: starImage, style: .plain, target: self, action: #selector(addToFavorite))
		navigationItem.setRightBarButton(addToFavoriteButt, animated: true)
	}
	
	
	@objc private func addToFavorite() {
		print("Save to UserDefaults: \(self.filmId)")
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if indexPath.item == 0 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: posterId, for: indexPath) as! DetailPosterCell
			cell.movie = popularMovies
			return cell
		} else if indexPath.item == 1 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: controlId, for: indexPath)
			cell.backgroundColor = .purple
			return cell
		} else {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: labelId, for: indexPath) as! DetailLabelCell
			cell.movie = popularMovies
			return cell
		}
	}
}

extension HomeDetailController {
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
}


extension HomeDetailController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		if indexPath.item == 0 {
			return .init(width: view.frame.width, height: 370)
		} else if indexPath.item == 1 {
			return .init(width: view.frame.width, height: 100)
		} else {
			return .init(width: view.frame.width, height: 400)
		}
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return .zero
	}
}

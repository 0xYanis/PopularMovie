//
//  HomeDetailController.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 11.02.2023.
//

import UIKit
import CoreData

class HomeDetailController: BaseController {
	
	
	fileprivate let posterId = "posterId"
	fileprivate let controlId = "controlId"
	fileprivate let labelId = "labelId"
	
	
	fileprivate let filmId: Int
	fileprivate var popularMovies: DetailMovie?
	fileprivate var timer: Timer?
	var favoriteFilm: [NSManagedObject] = []
	
	
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
		collectionView.register(DetailControlCell.self, forCellWithReuseIdentifier: controlId)
		collectionView.register(DetailLabelCell.self, forCellWithReuseIdentifier: labelId)
		
		
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
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if indexPath.item == 0 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: posterId, for: indexPath) as! DetailPosterCell
			cell.movie = popularMovies
			return cell
			
			
		} else if indexPath.item == 1 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: controlId, for: indexPath) as! DetailControlCell
			if checkFavorite() {
				cell.likeButton.tintColor = .yellow
				cell.likeButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
			} else {
				cell.likeButton.tintColor = .white
				cell.likeButton.setImage(UIImage(systemName: "star"), for: .normal)
			}
			cell.shareButton.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
			cell.linkButton.addTarget(self, action: #selector(linkTapped), for: .touchUpInside)
			cell.likeButton.addTarget(self, action: #selector(likeTapped), for: .touchUpInside)
			return cell
			
			
		} else {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: labelId, for: indexPath) as! DetailLabelCell
			cell.movie = popularMovies
			return cell
		}
	}
	
	
	fileprivate lazy var kinopoiskUrl = "https://www.kinopoisk.ru/film/\(self.filmId)/"
	fileprivate lazy var activityItems = ["Советую посмотреть", kinopoiskUrl]
	
	
	@objc fileprivate func shareTapped() {
		let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
		present(activityVC, animated: true, completion: nil)
	}
	
	
	@objc fileprivate func linkTapped() {
		guard let url = URL(string: kinopoiskUrl) else { return }
		if UIApplication.shared.canOpenURL(url) {
			UIApplication.shared.open(url, options: [:], completionHandler: nil)
		}
	}
	
	
	@objc fileprivate func likeTapped() {
		let film = popularMovies
		let title = film?.nameRu ?? ""
		let year = Int16(film?.year ?? 0)
		if checkFavorite() == false {
			let favorite = DataStoreManager.shared.saveFilm(image: film?.posterUrlPreview ?? "",
															isFavorite: true,
															title: title,
															year: year)
			if favorite != nil {
				favoriteFilm.append(favorite!)
				collectionView.reloadData()
			}
		} else {
			let arrRemovedObjects = DataStoreManager.shared.deleteFilm(key: "title", value: title)
			favoriteFilm = favoriteFilm.filter({ (param) -> Bool in
				if (arrRemovedObjects?.contains(param as! Favorite))!{
					return false
				}else{
					return true
				}
			})
			collectionView.reloadData()
		}
	}
	

	func checkFavorite() -> Bool {
		let isFavorite = DataStoreManager.shared.isFavoriteFilm(title: popularMovies?.nameRu ?? "")
		return isFavorite
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
			return .init(width: view.frame.width, height: 70)
		} else {
			return .init(width: view.frame.width, height: 500)
		}
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return .zero
	}
}

//
//  MediaPageController.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 16.02.2023.
//

import UIKit
import CoreData

class MediaPageController: BaseController {
	
	
	fileprivate let cellId  = "cellId"
	fileprivate let refreshControl = UIRefreshControl()
	var favoriteFilm: [NSManagedObject] = []
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		fetchAllFilms()
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()

		
		setupRefreshControl()
		collectionView.backgroundColor = UIColor(named: "background")
		collectionView.showsVerticalScrollIndicator = false
		collectionView.register(MediaCell.self, forCellWithReuseIdentifier: cellId)
	}
	
	
	fileprivate func setupRefreshControl() {
		refreshControl.tintColor = .NavBarTextColor
		refreshControl.addTarget(self, action: #selector(self.refreshAction(_:)), for: .valueChanged)
		collectionView.refreshControl = refreshControl
	}
	
	
	@objc fileprivate func refreshAction(_ sender: AnyObject) {
		collectionView.reloadData()
		refreshControl.endRefreshing()
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return favoriteFilm.count
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MediaCell
		let film = favoriteFilm[indexPath.item]
		let image = film.value(forKey: "image") as? String ?? ""
		let title = film.value(forKey: "title") as? String ?? ""
		let year = film.value(forKey: "year") as? Int16 ?? 0
		cell.imageView.loadImage(urlString: image)
		cell.nameLabel.text = title
		cell.dateLabel.text = "\(year)"
		return cell
	}
	
	
	func fetchAllFilms(){
		if DataStoreManager.shared.fetchAllFilms() != nil{
			favoriteFilm = DataStoreManager.shared.fetchAllFilms()!
			collectionView.reloadData()
		}
	}
}

extension MediaPageController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return .init(width: view.frame.width, height: 210)
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 15
	}
}


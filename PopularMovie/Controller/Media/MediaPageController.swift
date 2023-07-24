//
//  MediaPageController.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 16.02.2023.
//

import UIKit
import CoreData
import SDWebImage

class MediaPageController: BaseController {
	
	private let cellId  = "cellId"
	private lazy var refreshControl = UIRefreshControl()
    
	var favoriteFilm: [NSManagedObject] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupCollectionView()
		setupRefreshControl()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		fetchAllFilms()
	}
	
	override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
		favoriteFilm.count
	}
	
	override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellId,
            for: indexPath
        ) as! MediaCell
		let film = favoriteFilm[indexPath.item]
		let image = film.value(forKey: "image") as? String ?? ""
		let title = film.value(forKey: "title") as? String ?? ""
		let year = film.value(forKey: "year") as? Int16 ?? 0
        
		cell.imageView.sd_setImage(with: URL(string: image))
		cell.nameLabel.text = title
		cell.dateLabel.text = "\(year)"
        
		return cell
	}
    
}

private extension MediaPageController {
    
    func setupCollectionView() {
        collectionView.backgroundColor = UIColor(named: "background")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(
            MediaCell.self,
            forCellWithReuseIdentifier: cellId
        )
    }
    
    func fetchAllFilms(){
        guard let fetchedFilms = DataStoreManager.shared
            .fetchAllFilms() else { return }
        self.favoriteFilm = fetchedFilms
        collectionView.reloadData()
    }
    
    func setupRefreshControl() {
        refreshControl.tintColor = .NavBarTextColor
        refreshControl.addTarget(
            self,
            action: #selector(refreshAction),
            for: .valueChanged
        )
        collectionView.refreshControl = refreshControl
    }
    
    @objc func refreshAction() {
        collectionView.reloadData()
        refreshControl.endRefreshing()
    }
    
}

extension MediaPageController: UICollectionViewDelegateFlowLayout {
    
	func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
		.init(width: view.frame.width, height: 100)
	}
	
	func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
		15
	}
    
}


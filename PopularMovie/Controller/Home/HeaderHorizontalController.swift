//
//  HeaderHorizontalController.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import UIKit

class HeaderHorizontalController: HorizontalSnappingController {
	
	fileprivate let cellId = "cellId"
	
	var popularMovies: Page?
	var didSelectHandler: ((Film)->())?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupCollectionView()
	}
	
	override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
		return popularMovies?.films.count ?? 0
	}
	
	
	override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeHeaderCell
		let movie = popularMovies?.films[indexPath.item]
		cell.imageView.loadImage(urlString: movie?.posterUrlPreview ?? "")
		cell.nameLabel.text = movie?.nameEn ?? movie?.nameRu
		cell.dateLabel.text = movie?.year ?? "2023"
		cell.ratingLabel.text = movie?.rating ?? "0.0"
		return cell
	}
	
	
	override func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
		if let film = popularMovies?.films[indexPath.item] {
			didSelectHandler?(film)
		}
	}
}

private extension HeaderHorizontalController {
    func setupCollectionView() {
        collectionView.backgroundColor = UIColor(named: "background")
        collectionView.register(HomeHeaderCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = .init(top: 0, left: 15, bottom: 0, right: 15)
    }
}

// MARK: - DelegateFlowLayout protocol
extension HeaderHorizontalController: UICollectionViewDelegateFlowLayout {
	func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
		.init(top: 0, left: 0, bottom: 0, right: 0)
	}
	
	
	func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
		.init(width: view.frame.width - 240, height: view.frame.height)
	}
	
	
	func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
		15
	}
}

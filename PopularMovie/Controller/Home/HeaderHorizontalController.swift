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
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		collectionView.backgroundColor = UIColor(named: "background")
		collectionView.register(HomeHeaderCell.self, forCellWithReuseIdentifier: cellId)
		collectionView.showsHorizontalScrollIndicator = false
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return popularMovies?.pagesCount ?? 0
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeHeaderCell
		let movie = popularMovies?.films[indexPath.item]
		cell.imageView.loadImage(urlString: movie?.posterUrl ?? "")
		cell.nameLabel.text = movie?.nameEn ?? movie?.nameRu
		cell.dateLabel.text = movie?.year
		return cell
	}
}

// MARK: - DelegateFlowLayout protocol
extension HeaderHorizontalController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return .init(top: 0, left: 16, bottom: 0, right: 16)
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return .init(width: view.frame.width - 240, height: view.frame.height)
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 15
	}
}

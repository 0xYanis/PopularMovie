//
//  HomeFooterController.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 11.02.2023.
//

import UIKit

class FooterHorizontalController: HorizontalSnappingController {
	
	
	fileprivate let cellId = "cellId"
	var mostExpected: MostExpected?
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		collectionView.backgroundColor = UIColor(named: "background")
		collectionView.register(HomeFooterCell.self, forCellWithReuseIdentifier: cellId)
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.contentInset = .init(top: 0, left: 15, bottom: 0, right: 15)
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeFooterCell
		let topAwait = mostExpected?.films[indexPath.item]
		let genres = topAwait?.genres.first
		cell.imageView.loadImage(urlString: topAwait?.posterUrlPreview ?? "")
		cell.nameLabel.text = topAwait?.nameRu ?? topAwait?.nameEn ?? ""
		cell.dateLabel.text = topAwait?.year
		cell.ratingLabel.text = topAwait?.rating
		cell.descriptionLabel.text = genres?.genre ?? ""
		return cell
	}
}

//MARK: - DelegateFlowLayout protocol
extension FooterHorizontalController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return .init(width: view.frame.width - 48, height: view.frame.height - 25)
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return .zero
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 15
	}
}

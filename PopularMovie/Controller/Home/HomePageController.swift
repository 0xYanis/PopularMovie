//
//  MainViewController.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 08.02.2023.
//

import UIKit

class HomePageController: BaseController {
	
	
	fileprivate let headerId = "headerId"
	fileprivate let cellId = "cellId"
	
	var popularMovies: Page?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		collectionView.backgroundColor = UIColor(named: "background")
		collectionView.showsVerticalScrollIndicator = false
		
		
		collectionView.register(HomeHeader.self,forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
		collectionView.register(HomeGroupCell.self, forCellWithReuseIdentifier: cellId)
		
		
		fetchData()
	}
	
	
	fileprivate func fetchData() {
		Service.shared.fetchMovies { popularMovie, err in
			self.popularMovies = popularMovie
			DispatchQueue.main.async {
				self.collectionView.reloadData()
			}
		}
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HomeHeader
		header.headerHorizontalController.popularMovies = popularMovies
		header.headerHorizontalController.collectionView.reloadData()
		return header
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return .init(width: view.frame.width, height: 300)
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 2
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
		return cell
	}
}

// MARK: - DelegateFlowLayout protocol
extension HomePageController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return .init(width: view.frame.width, height: 240)
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return .init(top: 20, left: 0, bottom: 0, right: 0)
	}
}

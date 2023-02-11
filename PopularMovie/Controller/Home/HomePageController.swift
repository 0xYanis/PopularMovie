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
	fileprivate let footerId = "footerId"
	fileprivate let searchController = UISearchController(searchResultsController: nil)
	fileprivate let activityIndecatorView: UIActivityIndicatorView = {
		let aiv = UIActivityIndicatorView(style: .medium)
		aiv.color = .white
		aiv.startAnimating()
		aiv.hidesWhenStopped = true
		return aiv
	}()
	
	
	var popularMovies: Page?
	var tvGroup = [TVGroup]()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		collectionView.backgroundColor = UIColor(named: "background")
		collectionView.showsVerticalScrollIndicator = false
		
		
		collectionView.register(HomeHeader.self,forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
		collectionView.register(HomeGroupCell.self, forCellWithReuseIdentifier: cellId)
		collectionView.register(HomeFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
		
		
		view.addSubview(activityIndecatorView)
		activityIndecatorView.fillSuperview()
		
		
		setupSearchBar()
		fetchData()
	}
	
	
	fileprivate func setupSearchBar() {
		definesPresentationContext = true
		navigationItem.searchController = self.searchController
		navigationItem.hidesSearchBarWhenScrolling = true
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		
		
		switch kind {
		case UICollectionView.elementKindSectionHeader:
			let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HomeHeader
			header.headerHorizontalController.popularMovies = popularMovies
			header.headerHorizontalController.collectionView.reloadData()
			
			header.headerHorizontalController.didSelectHandler = { [weak self] itemMovie in
				let controller = HomeDetailController(filmId: itemMovie.filmId)
				self?.navigationController?.pushViewController(controller, animated: true)
			}
			return header
			
			
		case UICollectionView.elementKindSectionFooter:
			let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath) as! HomeFooter
			return footer
			
			
		default:
			assert(false, "Unexpected element kind")
		}
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return tvGroup.count
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeGroupCell
		let tvGroup = tvGroup[indexPath.item]
		cell.horizontalController.tvGroup = tvGroup
		if indexPath.item == 0 {
			cell.titleLabel.text = "TV Series"
		} else if indexPath.item == 1 {
			cell.titleLabel.text = "Mini Series"
		}
		cell.horizontalController.collectionView.reloadData()
		cell.horizontalController.didSelectHandler = { [weak self] itemTv in
			let controller = HomeDetailController(filmId: itemTv.kinopoiskId)
			self?.navigationController?.pushViewController(controller, animated: true)
		}
		return cell
	}
}

extension HomePageController {
	fileprivate func fetchData() {
		var groupOne: TVGroup?
		var groupTwo: TVGroup?
		let dispatchGroup = DispatchGroup()
		
		
		dispatchGroup.enter()
		Service.shared.fetchMovies { movies, error in
			dispatchGroup.leave()
			self.popularMovies = movies
		}
		
		
		dispatchGroup.enter()
		Service.shared.fetchTVSeries { tvgroup, error in
			dispatchGroup.leave()
			groupOne = tvgroup
		}
		
		
		dispatchGroup.enter()
		Service.shared.fetchMiniSeries { tvgroup, error in
			dispatchGroup.leave()
			groupTwo = tvgroup
		}
		
		
		dispatchGroup.notify(queue: .main) {
			self.activityIndecatorView.stopAnimating()
			if let group = groupOne {
				self.tvGroup.append(group)
			}
			if let group = groupTwo  {
				self.tvGroup.append(group)
			}
			self.collectionView.reloadData()
		}
	}
}

// MARK: - DelegateFlowLayout protocol
extension HomePageController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return .init(width: view.frame.width, height: 300)
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return .init(width: view.frame.width, height: 240)
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return .init(top: 20, left: 0, bottom: 0, right: 0)
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
		return .init(width: view.frame.width, height: 300)
	}
}

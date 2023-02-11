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
	
	
	fileprivate var popularMovies: Page?
	fileprivate var tvGroup: TVGroup?
	
	
	init(filmId: Int) {
		self.filmId = filmId
		super.init()
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		view.backgroundColor = .red
		collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: posterId)
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 1
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: posterId, for: indexPath)
		cell.backgroundColor = .red
		return cell
	}
}

//
//  HorizontalSnappingController.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import UIKit

class HorizontalSnappingController: UICollectionViewController {
	
	init() {
		let layout = SnappingLayout()
		layout.scrollDirection = .horizontal
		super.init(collectionViewLayout: layout)
		collectionView.decelerationRate = .fast
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

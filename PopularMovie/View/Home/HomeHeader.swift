//
//  HomeHeader.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import UIKit

class HomeHeader: UICollectionReusableView {
	
	
	let headerHorizontalController = HeaderHorizontalController()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		addSubview(headerHorizontalController.view)
		headerHorizontalController.view.fillSuperview()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

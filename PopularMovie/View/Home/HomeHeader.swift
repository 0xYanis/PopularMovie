//
//  HomeHeader.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import UIKit

class HomeHeader: UICollectionReusableView {
	
	
	let titleLabel = UILabel(text: "Popular Movie", font: .boldSystemFont(ofSize: 20))
	let headerHorizontalController = HeaderHorizontalController()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		addSubview(titleLabel)
		titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 0))
		
		
		addSubview(headerHorizontalController.view)
		headerHorizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

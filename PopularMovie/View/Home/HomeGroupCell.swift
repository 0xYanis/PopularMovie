//
//  HomeGroupCell.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import UIKit

class HomeGroupCell: UICollectionViewCell {
	
	
	let titleLabel = UILabel(text: "Popular Movie", font: .boldSystemFont(ofSize: 20))
	let horizontalController = HomeHorizontalController()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		backgroundColor = .brown
		
		
		addSubview(titleLabel)
		titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
		
		
		addSubview(horizontalController.view)
		horizontalController.view.backgroundColor = .red
		horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

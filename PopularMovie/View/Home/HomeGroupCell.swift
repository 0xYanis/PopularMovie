//
//  HomeGroupCell.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import UIKit

class HomeGroupCell: UICollectionViewCell {
	
	
	let titleLabel = UILabel(text: "TV Show", font: .boldSystemFont(ofSize: 20), color: .white)
	let horizontalController = HomeHorizontalController()
	
	override init(frame: CGRect) {
		super.init(frame: frame)

		
		addSubview(titleLabel)
		titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 0))
		
		
		addSubview(horizontalController.view)
		horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

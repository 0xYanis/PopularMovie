//
//  HomeDetailCell.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 11.02.2023.
//

import UIKit

class HomeDetailCell: UICollectionViewCell {
	
	
	let imageView = UIImageView()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		imageView.backgroundColor = .blue
		addSubview(imageView)
		imageView.fillSuperview()
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

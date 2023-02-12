//
//  HomeFooterCell.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 11.02.2023.
//

import UIKit

class HomeFooterCell: UICollectionViewCell {
	
	
	let imageView = UIImageView(cornerRadius: 15)
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		imageView.backgroundColor = .red
		addSubview(imageView)
		imageView.fillSuperview()
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

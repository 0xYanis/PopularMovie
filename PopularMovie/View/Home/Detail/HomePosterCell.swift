//
//  HomeDetailCell.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 11.02.2023.
//

import UIKit

class HomePosterCell: UICollectionViewCell {
	
	
	var movie: DetailMovie! {
		didSet {
			imageView.loadImage(urlString: movie?.posterUrl ?? "")
		}
	}
	
	
	
	let imageView = UIImageView()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		imageView.contentMode = .scaleAspectFit
		imageView.layer.cornerRadius = 15
		addSubview(imageView)
		imageView.fillSuperview(padding: .init(top: 120, left: 50, bottom: 0, right: 50))
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

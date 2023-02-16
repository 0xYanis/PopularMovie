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
			backImage.loadImage(urlString: movie?.posterUrl ?? "")
		}
	}
	
	
	let imageView = UIImageView(cornerRadius: 15)
	let backImage = UIImageView()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		setupBlurBackground()
		setupImageView()
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	fileprivate func setupBlurBackground() {
		let blurEffect = UIBlurEffect(style: .dark)
		let blurView = UIVisualEffectView(effect: blurEffect)
		backImage.addSubview(blurView)
		blurView.fillSuperview()
		backgroundView = backImage
	}
	
	
	fileprivate func setupImageView() {
		imageView.contentMode = .scaleAspectFit
		addSubview(imageView)
		imageView.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
	}
}

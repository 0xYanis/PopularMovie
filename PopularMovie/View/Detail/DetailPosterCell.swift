//
//  HomeDetailCell.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 11.02.2023.
//

import UIKit
import SDWebImage

final class DetailPosterCell: UICollectionViewCell {
	
	var movie: DetailMovie! {
		didSet {
            let url = URL(string: movie?.posterUrl ?? "")
            imageView.sd_setImage(with: url)
            backImage.image = imageView.image
		}
	}
	
    lazy var imageView = UIImageView(cornerRadius: 15)
    lazy var backImage = UIImageView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupBlurBackground()
		setupImageView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("")
	}
    
}

private extension DetailPosterCell {
    
    func setupBlurBackground() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        backImage.addSubview(blurView)
        blurView.fillSuperview()
        backgroundView = backImage
    }
    
    func setupImageView() {
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        imageView.fillSuperview(padding: .init(
            top: 100,
            left: 50,
            bottom: 0,
            right: 50)
        )
    }
    
}

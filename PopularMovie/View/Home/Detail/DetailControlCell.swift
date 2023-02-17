//
//  DetailControlCell.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 17.02.2023.
//

import UIKit

class DetailControlCell: UICollectionViewCell {
	
	
	let shareButton = UIButton(height: 40, width: 40, cornerRadius: 20)
	let linkButton = UIButton(height: 40, width: 100, cornerRadius: 20)
	let likeButton = UIButton(height: 40, width: 40, cornerRadius: 20)
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		backgroundColor = .black
		setupButtons()
		let buttonStack = UIStackView(arrangedSubviews: [
		shareButton, linkButton, likeButton
		], customSpacing: 30)
		
		
		addSubview(buttonStack)
		buttonStack.centerXInSuperview()
		buttonStack.centerYInSuperview()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	fileprivate func setupButtons() {
		shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
		shareButton.tintColor = .white
		
		
		linkButton.setTitle("Play", for: .normal)
		linkButton.setTitleColor(.white, for: .normal)
		
		
		likeButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
		likeButton.tintColor = .white
	}
}

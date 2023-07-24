//
//  DetailControlCell.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 17.02.2023.
//

import UIKit

final class DetailControlCell: UICollectionViewCell {
	
    lazy var shareButton = UIButton(height: 40, width: 40, cornerRadius: 20)
    lazy var linkButton = UIButton(height: 40, width: 100, cornerRadius: 20)
    lazy var likeButton = UIButton(height: 40, width: 40, cornerRadius: 20)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
        initialize()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
    
}

private extension DetailControlCell {
    func initialize() {
        backgroundColor = .black
        setupButtons()
        
        let buttonStack = UIStackView(arrangedSubviews: [
        shareButton, linkButton, likeButton
        ], customSpacing: 30)
        
        addSubview(buttonStack)
        buttonStack.centerXInSuperview()
        buttonStack.centerYInSuperview()
    }
    
    func setupButtons() {
        shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        shareButton.tintColor = .white
        linkButton.setTitle("Play", for: .normal)
        linkButton.setTitleColor(.white, for: .normal)
    }
    
}

//
//  MediaCell.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 16.02.2023.
//

import UIKit

final class MediaCell: UICollectionViewCell {
	
	lazy var imageView = UIImageView(cornerRadius: 10)
    lazy var nameLabel = UILabel(text: "Name of Movie", font: .systemFont(ofSize: 18),numberOfLines: 2, color: .white)
    lazy var dateLabel = UILabel(text: "Aug. 22, 2020", font: .systemFont(ofSize: 16), color: .gray)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		initialize()
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
    
}

private extension MediaCell {
    func initialize() {
        setupImageView()
        let stackView = VerticalStackView(arrangedSubviews: [
            nameLabel, dateLabel, UIView()
        ], spacing: 5)
        let horizontalStack = UIStackView(arrangedSubviews: [
            imageView, stackView
        ], customSpacing: 8)
        addSubview(horizontalStack)
        horizontalStack.fillSuperview(padding: .init(
            top: 0, left: 20,
            bottom: 10, right: 20)
        )
    }
    
    func setupImageView() {
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.constrainWidth(constant: 70)
    }
    
}

//
//  HomeFooterCell.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 11.02.2023.
//

import UIKit

final class HomeFooterCell: UICollectionViewCell {
    
    lazy var imageView = UIImageView(cornerRadius: 10)
    lazy var nameLabel = UILabel(text: "Name of Movie", font: .boldSystemFont(ofSize: 17), color: .white)
    lazy var dateLabel = UILabel(text: "Date: Aug. 22, 2020", font: .systemFont(ofSize: 16), color: .white)
    lazy var ratingLabel = UILabel(text: "Rating: 9.1", font: .systemFont(ofSize: 16), color: .white)
    lazy var descriptionLabel = UILabel(text: "Сюжет", font: .systemFont(ofSize: 16), color: .white)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		backgroundColor = .NavBarTextColor
		layer.cornerRadius = 10
		
		setupImageView()
		
		
		let verticalStack = VerticalStackView(arrangedSubviews: [
		nameLabel, dateLabel, ratingLabel, descriptionLabel, UIView()
		], spacing: 8)
		
		
		let horizontalStack = UIStackView(arrangedSubviews: [
		imageView, verticalStack, UIView()
		], customSpacing: 8)
		
		
		addSubview(horizontalStack)
		horizontalStack.fillSuperview(padding: .init(top: 8, left: 8, bottom: 8, right: 8))
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	private func setupImageView() {
		imageView.clipsToBounds = true
		imageView.contentMode = .scaleAspectFill
		imageView.constrainWidth(constant: 120)
	}
}

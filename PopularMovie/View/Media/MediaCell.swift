//
//  MediaCell.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 16.02.2023.
//

import UIKit

class MediaCell: UICollectionViewCell {
	
	
	let imageView = UIImageView(cornerRadius: 10)
	let nameLabel = UILabel(text: "Name of Movie", font: .systemFont(ofSize: 18),numberOfLines: 2, color: .white)
	let dateLabel = UILabel(text: "Aug. 22, 2020", font: .systemFont(ofSize: 16), color: .gray)

	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		setupImageView()
		let stackView = VerticalStackView(arrangedSubviews: [
			nameLabel, dateLabel, UIView()
		], spacing: 5)
		let horizontalStack = UIStackView(arrangedSubviews: [
			imageView, stackView
		], customSpacing: 8)
		addSubview(horizontalStack)
		horizontalStack.fillSuperview(padding: .init(top: 0, left: 20, bottom: 10, right: 20))
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	fileprivate func setupImageView() {
		imageView.clipsToBounds = true
		imageView.contentMode = .scaleAspectFill
		imageView.constrainWidth(constant: 70)
	}
}

//
//  HomeRowCell.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import UIKit

class HomeRowCell: UICollectionViewCell {
	
	
	let imageView = UIImageView(cornerRadius: 10)
	let nameLabel = UILabel(text: "Name of Movie", font: .systemFont(ofSize: 14), color: .white)
	let dateLabel = UILabel(text: "Aug. 22, 2020", font: .systemFont(ofSize: 11), color: .gray)
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		let stackView = VerticalStackView(arrangedSubviews: [
			imageView, nameLabel, dateLabel
		])
		addSubview(stackView)
		stackView.fillSuperview()
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

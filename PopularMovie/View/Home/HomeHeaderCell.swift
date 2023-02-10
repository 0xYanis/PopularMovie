//
//  HomeHeaderCell.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import UIKit

class HomeHeaderCell: UICollectionViewCell {
	
	
	let imageView = UIImageView(cornerRadius: 10)
	let nameLabel = UILabel(text: "Name of Movie", font: .systemFont(ofSize: 14), color: .white)
	let dateLabel = UILabel(text: "Aug. 22, 2020", font: .systemFont(ofSize: 11), color: .gray)
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		let stackView = VerticalStackView(arrangedSubviews: [
			imageView, nameLabel, dateLabel
		], spacing: 4)
		addSubview(stackView)
		stackView.fillSuperview(padding: .init(top: 8, left: 0, bottom: 0, right: 0))
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

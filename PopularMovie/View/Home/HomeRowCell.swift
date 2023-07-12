//
//  HomeRowCell.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import UIKit

final class HomeRowCell: UICollectionViewCell {

	lazy var imageView = UIImageView(cornerRadius: 10)
    lazy var nameLabel = UILabel(
        text: "Name of Movie",
        font: .systemFont(ofSize: 14),
        color: .white
    )
    lazy var dateLabel = UILabel(
        text: "Aug. 22, 2020",
        font: .systemFont(ofSize: 11),
        color: .gray
    )
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		initialize()
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
    
}

private extension HomeRowCell {
    func initialize() {
        let stackView = VerticalStackView(arrangedSubviews: [
            imageView, nameLabel, dateLabel
        ])
        addSubview(stackView)
        stackView.fillSuperview()
    }
}

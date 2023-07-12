//
//  HomeHeaderCell.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import UIKit

final class HomeHeaderCell: UICollectionViewCell {
    
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
    lazy var ratingLabel = UILabel(
        text: "9.1",
        font: .systemFont(ofSize: 11),
        color: .yellow
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension HomeHeaderCell {
    func initialize() {
        let horizontalStack = UIStackView(
            arrangedSubviews: [
                dateLabel, UIView(), ratingLabel
            ]
        )
        let stackView = VerticalStackView(
            arrangedSubviews: [
                imageView, nameLabel, horizontalStack
            ], spacing: 4
        )
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(
            top: 8, left: 0,
            bottom: 0, right: 0)
        )
    }
    
}

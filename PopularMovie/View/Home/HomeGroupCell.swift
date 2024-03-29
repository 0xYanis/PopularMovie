//
//  HomeGroupCell.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import UIKit

final class HomeGroupCell: UICollectionViewCell {
	
	lazy var titleLabel = UILabel(
        text: "TV Series",
        font: .boldSystemFont(ofSize: 20),
        color: .white
    )
	lazy var horizontalController = HomeHorizontalController()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		initialize()
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

private extension HomeGroupCell {
    
    func initialize() {
        addSubview(titleLabel)
        titleLabel.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: nil,
            trailing: trailingAnchor,
            padding: .init(top: 16, left: 16, bottom: 0, right: 0)
        )
        
        addSubview(horizontalController.view)
        horizontalController.view.anchor(
            top: titleLabel.bottomAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )
    }
    
}

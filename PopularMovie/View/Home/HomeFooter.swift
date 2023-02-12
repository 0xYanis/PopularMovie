//
//  HomeFooter.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 11.02.2023.
//

import UIKit

class HomeFooter: UICollectionReusableView {
	
	
	let titleLabel = UILabel(text: "Most Expected", font: .boldSystemFont(ofSize: 20), color: .white)
	let footerHorizontalController = FooterHorizontalController()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		addSubview(titleLabel)
		titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 0))
		
		
		addSubview(footerHorizontalController.view)
		footerHorizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 15, left: 0, bottom: 25, right: 0))
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

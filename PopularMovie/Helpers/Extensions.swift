//
//  Extensions.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import UIKit

extension UILabel {
	convenience init(text: String, font: UIFont, numberOfLines: Int = 1, color: CIColor) {
		self.init(frame: .zero)
		self.text = text
		self.font = font
		self.textColor = UIColor(ciColor: color)
		self.numberOfLines = numberOfLines
	}
}


extension UIImageView {
	convenience init(cornerRadius: CGFloat) {
		self.init(image: nil)
		self.layer.cornerRadius = cornerRadius
		self.clipsToBounds = true
		self.contentMode = .scaleAspectFill
	}
}


extension UIStackView {
	convenience init(arrangedSubviews: [UIView], customSpacing: CGFloat = 0) {
		self.init(arrangedSubviews: arrangedSubviews)
		self.spacing = customSpacing
	}
}

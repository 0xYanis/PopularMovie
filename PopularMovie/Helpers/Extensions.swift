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


extension UIButton {
	convenience init(height: CGFloat, width: CGFloat, cornerRadius: CGFloat) {
		self.init(frame: .zero)
		self.backgroundColor = .NavBarTextColor
		self.layer.cornerRadius = cornerRadius
		self.constrainWidth(constant: width)
		self.constrainHeight(constant: height)
	}
}


extension UIStackView {
	convenience init(arrangedSubviews: [UIView], customSpacing: CGFloat = 0) {
		self.init(arrangedSubviews: arrangedSubviews)
		self.spacing = customSpacing
	}
}


extension UIImageView {
	func loadImage(urlString: String) {
		guard let url = URL(string: urlString) else { return }
		DispatchQueue.global().async { [weak self] in
			if let data = try? Data(contentsOf: url) {
				if let image = UIImage(data: data) {
					DispatchQueue.main.async {
						self?.image = image
					}
				}
			}
		}
	}
}


extension UIColor {
	static var tabBarItemAccent: UIColor {
		#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
	}
	static var tabBarColor: UIColor {
		#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 0.8953199576)
	}
	static var tabBarItemLight: UIColor {
		#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 0.7223851286)
	}
	static var NavBarTextColor: UIColor {
		#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
	}
}


extension UIViewController {
	func setTabBarHidden(_ hidden: Bool, animated: Bool = true, duration: TimeInterval = 0.3) {
		if animated {
			if let frame = self.tabBarController?.tabBar.frame {
				let factor: CGFloat = hidden ? 1 : -1
				let y = frame.origin.y + (frame.size.height * factor)
				UIView.animate(withDuration: duration, animations: {
					self.tabBarController?.tabBar.frame = CGRect(x: frame.origin.x, y: y, width: frame.width, height: frame.height)
				})
				return
			}
		}
	}
}

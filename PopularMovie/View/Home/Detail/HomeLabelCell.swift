//
//  HomeLabelCell.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 11.02.2023.
//

import UIKit

class HomeLabelCell: UICollectionViewCell {
	
	
	var movie: DetailMovie? {
		didSet {
			let year = movie?.year ?? 0
			let genre = movie?.genres.first ?? Genre(genre: "none")
			titleLabel.text = movie?.nameOriginal ?? movie?.nameRu
			yearLabel.text = "\(year)"
			genreLabel.text = genre.genre
			lengthLabel.text = movie?.imdbId
		}
	}
	
	
	let titleLabel = UILabel(text: "Harry Potter", font: .boldSystemFont(ofSize: 32), numberOfLines: 2, color: .white)
	let yearLabel = UILabel(text: "2002", font: .systemFont(ofSize: 14), color: .gray)
	let genreLabel = UILabel(text: "Action", font: .systemFont(ofSize: 14), color: .gray)
	let lengthLabel = UILabel(text: "2h 55m", font: .systemFont(ofSize: 14), color: .gray)
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		let horizontalStack = UIStackView(arrangedSubviews: [
		yearLabel, genreLabel, lengthLabel
		], customSpacing: 10)
		let verticalStack = VerticalStackView(arrangedSubviews: [
		titleLabel, horizontalStack, UIView()
		], spacing: 15)
		
		
		addSubview(verticalStack)
		verticalStack.fillSuperview()
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

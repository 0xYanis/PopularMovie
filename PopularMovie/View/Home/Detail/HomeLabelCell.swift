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
			let genreFirst = movie?.genres.first ?? Genre(genre: "None")
			let genreSecond = movie?.genres.last ?? Genre(genre: "None")
			let countries = movie?.countries.first ?? Country(country: "None")
			let rating = movie?.ratingKinopoisk ?? movie?.ratingImdb ?? 0.0
			let lenght = movie?.filmLength ?? 100
			
			
			titleLabel.text = movie?.nameOriginal ?? movie?.nameRu
			ratingLabel.text = "\(rating)"
			yearLabel.text = "Год: \(year), "
			genreLabel.text = "Жанр: " + genreFirst.genre + ", " + genreSecond.genre
			countryLabel.text = "Страна: " + countries.country + ", "
			filmLength.text = "Длина фильма: \(lenght)мин."
			descriptionLabel.text = movie?.description ?? ""
		}
	}
	
	
	let titleLabel = UILabel(text: "Some Film", font: .boldSystemFont(ofSize: 28), numberOfLines: 2, color: .white)
	let ratingLabel = UILabel(text: "0.0", font: .boldSystemFont(ofSize: 16), color: .yellow)
	let yearLabel = UILabel(text: "None", font: .systemFont(ofSize: 16), color: .white)
	let genreLabel = UILabel(text: "None", font: .systemFont(ofSize: 16), color: .white)
	let countryLabel = UILabel(text: "None", font: .systemFont(ofSize: 16), color: .white)
	let filmLength = UILabel(text: "000", font: .systemFont(ofSize: 16), color: .white)
	let descriptionLabel = UILabel(text: "", font: .systemFont(ofSize: 14), numberOfLines: 25, color: .gray)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		let verticalStack = VerticalStackView(arrangedSubviews: [
			titleLabel, ratingLabel, yearLabel, genreLabel, countryLabel, filmLength, descriptionLabel, UIView()
		], spacing: 15)
		
		
		addSubview(verticalStack)
		
		verticalStack.fillSuperview(padding: .init(top: 0, left: 16, bottom: 50, right: 16))
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

//
//  HomeLabelCell.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 11.02.2023.
//

import UIKit

final class DetailLabelCell: UICollectionViewCell {
    
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
    
    lazy var titleLabel = UILabel(
        text: "",
        font: .boldSystemFont(ofSize: 28),
        numberOfLines: 2,
        color: .white)
    lazy var ratingLabel = UILabel(
        text: "",
        font: .boldSystemFont(ofSize: 16),
        color: .yellow)
    lazy var yearLabel = UILabel(
        text: "",
        font: .systemFont(ofSize: 16),
        color: .white)
    lazy var genreLabel = UILabel(
        text: "",
        font: .systemFont(ofSize: 16),
        color: .white)
    lazy var countryLabel = UILabel(
        text: "",
        font: .systemFont(ofSize: 16),
        color: .white)
    lazy var filmLength = UILabel(
        text: "",
        font: .systemFont(ofSize: 16),
        color: .white)
    lazy var descriptionLabel = UILabel(
        text: "",
        font: .systemFont(ofSize: 14),
        numberOfLines: 25,
        color: .gray)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
}

private extension DetailLabelCell {
    
    func initialize() {
        let verticalStack = VerticalStackView(
            arrangedSubviews: [
                titleLabel, ratingLabel,
                yearLabel, genreLabel,
                countryLabel, filmLength,
                descriptionLabel, UIView()
            ], spacing: 15)
        
        addSubview(verticalStack)
        verticalStack.fillSuperview(padding: .init(
            top: 0, left: 16,
            bottom: 50, right: 16)
        )
    }
    
}

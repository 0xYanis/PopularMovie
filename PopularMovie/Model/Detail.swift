//
//  Detail.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 11.02.2023.
//

import Foundation

struct DetailMovie: Decodable {
	let kinopoiskId: Int
	let imdbId, nameRu: String?
	let nameOriginal: String?
	let countries: [Country]
	let genres: [Genre]
	let ratingKinopoisk: Double
	let ratingImdb: Double?
	let year: Int
	let posterUrl, posterUrlPreview: String
}

struct Country: Decodable {
	let country: String
}

// MARK: - Genre
struct Genre: Decodable {
	let genre: String
}


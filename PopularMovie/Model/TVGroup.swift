//
//  TVShow.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 11.02.2023.
//

import Foundation

struct TVGroup: Decodable {
	let items: [ItemTV]
}


struct ItemTV: Decodable {
	let kinopoiskId: Int?
	let imdbId: String?
	let nameRu: String?
	let nameOriginal: String?
	var genres: [TVGenre]
	let ratingImdb: Double?
	let year: Int?
	let type: String?
	let posterUrl: String?
	let posterUrlPreview: String?
}


struct TVGenre: Codable {
	let genre: String?
}

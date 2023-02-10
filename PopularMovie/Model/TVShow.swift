//
//  TVShow.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 11.02.2023.
//

import Foundation

struct TVShow: Decodable {
	let items: [ItemTVShow]
}


struct ItemTVShow: Decodable {
	let kinopoiskId: Int
	let imdbId: String?
	let nameRu: String?
	let nameOriginal: String
	let genres: [TVShowGenre]
	let ratingImdb: Double?
	let year: Int
	let type: String
	let posterUrl: String
	let posterUrlPreview: String
}


struct TVShowGenre: Codable {
	let genre: String
}

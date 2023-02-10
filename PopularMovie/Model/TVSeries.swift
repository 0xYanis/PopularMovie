//
//  TVSeries.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 11.02.2023.
//

import Foundation

struct TVSeries: Decodable {
	let items: [ItemsTVSeries]
}


struct ItemsTVSeries: Decodable {
	let kinopoiskId: Int
	let imdbId: String?
	let nameRu: String?
	let nameOriginal: String
	let genres: [TVSeriesGenre]
	let ratingImdb: Double?
	let year: Int
	let type: String
	let posterUrl: String
	let posterUrlPreview: String
}


struct TVSeriesGenre: Codable {
	let genre: String
}

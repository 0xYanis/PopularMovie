//
//  MostExpected.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 13.02.2023.
//

import Foundation

struct MostExpected: Decodable {
	let pagesCount: Int
	let films: [TopAwait]
}


struct TopAwait: Decodable {
	let filmID: Int?
	let nameRu: String?
	let nameEn: String?
	let year: String?
	let filmLength: String?
	let countries: [MostCountry]
	let genres: [MostGenre]
	let rating: String?
	let ratingVoteCount: Int?
	let posterUrl, posterUrlPreview: String?
}


struct MostCountry: Codable {
	let country: String?
}


struct MostGenre: Codable {
	let genre: String?
}

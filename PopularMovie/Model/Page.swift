//
//  Movie.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import Foundation

struct Page: Decodable {
	let films: [Film]
}


struct Film: Decodable {
	let filmId: Int
	let nameRu: String?
	let nameEn: String?
	let year: String?
	let filmLength: String?
	let rating: String?
	let ratingVoteCount: Int?
	let posterUrl: String?
	let posterUrlPreview: String?
}

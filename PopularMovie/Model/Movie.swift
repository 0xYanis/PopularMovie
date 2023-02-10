//
//  Movie.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import Foundation

struct Movie: Decodable {
	let kinopoiskId: Int
	let nameOriginal: String
	let posterUrl: String
	let year: Int
}

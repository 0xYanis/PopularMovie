//
//  Service.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import Foundation

class Service {
	
	
	static let shared = Service()
	
	
	func fetchMovies(completion: @escaping (Page?, Error?) -> ()) {
		let urlString = "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_100_POPULAR_FILMS&page=1"
		fetchGenericJSONData(urlString, completion: completion)
		
	}
	
	
	func fetchTVSeries(completion: @escaping (TVGroup?, Error?) -> ()) {
		let urlString = "https://kinopoiskapiunofficial.tech/api/v2.2/films?order=RATING&type=TV_SERIES&ratingFrom=7&ratingTo=10&yearFrom=1000&yearTo=3000&page=1"
		fetchGenericJSONData(urlString, completion: completion)
	}
	
	
	func fetchMiniSeries(completion: @escaping (TVGroup?, Error?) -> ()) {
		let urlString = "https://kinopoiskapiunofficial.tech/api/v2.2/films?order=RATING&type=MINI_SERIES&ratingFrom=7&ratingTo=10&yearFrom=1000&yearTo=3000&page=1"
		fetchGenericJSONData(urlString, completion: completion)
	}
	
	
	func fetchMostExpected(completion: @escaping (MostExpected?, Error?) -> ()) {
		let urlString = "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_AWAIT_FILMS&page=1"
		fetchGenericJSONData(urlString, completion: completion)
	}
	
	
	func fetchGenericJSONData<T: Decodable>(_ urlString: String, completion: @escaping (T?, Error?) -> ()) {
		DispatchQueue.global().async {
			guard let url = URL(string: urlString) else { return }
			var request = URLRequest(url:url)
			request.httpMethod = "GET"
			request.setValue("application/json", forHTTPHeaderField: "accept")
			request.setValue("0f8b1961-213e-4781-b4ad-0d70764fa882", forHTTPHeaderField: "X-API-KEY")
			
			
			URLSession.shared.dataTask(with: request) { (data, resp, err) in
				if let err = err {
					completion(nil, err)
					return
				}
				
				
				do {
					let objects = try JSONDecoder().decode(T.self, from: data!)
					completion(objects, nil)
				} catch {
					completion(nil, error)
				}
			}.resume()
		}
	}
}

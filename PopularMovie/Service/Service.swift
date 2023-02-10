//
//  Service.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import Foundation

class Service {
	
	
	static let shared = Service()
	
	
	
	func fetchMovie(completion: @escaping (Movie?, Error?) -> ()) {
		let urlString = "https://kinopoiskapiunofficial.tech/api/v2.2/films/"
		fetchGenericJSONData(urlString, completion: completion)
	}
	
	
	private func fetchGenericJSONData<T: Decodable>(_ urlString: String, completion: @escaping (T?, Error?) -> ()) {
		guard let url = URL(string: urlString) else { return }
		let yourAuthorizationToken = "X-API-KEY: 0f8b1961-213e-4781-b4ad-0d70764fa882"
		
		var request = URLRequest(url:url)
		request.httpMethod = "GET"
		request.setValue(yourAuthorizationToken, forHTTPHeaderField: "accept: application/json")
		
		let task = URLSession.shared.dataTask(with: request) { (data, resp, err) in
			if let err = err {
				completion(nil, err)
				return
			}
			do {
				let objects = try JSONDecoder().decode(T.self, from: data!)
				// success
				completion(objects, nil)
			} catch {
				completion(nil, error)
			}
		}
		task.resume()
	}
}

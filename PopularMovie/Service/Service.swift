//
//  Service.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import Foundation

fileprivate enum URLStrings : String {
    case movies = "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_100_POPULAR_FILMS&page=1"
    case tvSeries = "https://kinopoiskapiunofficial.tech/api/v2.2/films?order=RATING&type=TV_SERIES&ratingFrom=7&ratingTo=10&yearFrom=1000&yearTo=3000&page=1"
    case miniSeries = "https://kinopoiskapiunofficial.tech/api/v2.2/films?order=RATING&type=MINI_SERIES&ratingFrom=7&ratingTo=10&yearFrom=1000&yearTo=3000&page=1"
    case mostExpected = "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_AWAIT_FILMS&page=1"
}

final class Service {
    
    static let shared = Service()
    
    private init() {}
    
    func fetchMovies(
        completion: @escaping (Page?, Error?) -> ()
    ) {
        let urlString: URLStrings = .movies
        fetchGenericJSONData(
            urlString.rawValue,
            completion: completion
        )
    }
    
    func fetchTVSeries(
        completion: @escaping (TVGroup?, Error?) -> ()
    ) {
        let urlString: URLStrings = .tvSeries
        fetchGenericJSONData(
            urlString.rawValue,
            completion: completion
        )
    }
    
    func fetchMiniSeries(
        completion: @escaping (TVGroup?, Error?) -> ()
    ) {
        let urlString: URLStrings = .miniSeries
        fetchGenericJSONData(
            urlString.rawValue,
            completion: completion
        )
    }
    
    func fetchMostExpected(
        completion: @escaping (MostExpected?, Error?) -> ()
    ) {
        let urlString: URLStrings = .mostExpected
        fetchGenericJSONData(
            urlString.rawValue,
            completion: completion
        )
    }
    
}

extension Service {
    func fetchGenericJSONData<T: Decodable>(
        _ urlString: String,
        completion: @escaping (T?, Error?) -> ()
    ) {
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url:url)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("0f8b1961-213e-4781-b4ad-0d70764fa882", forHTTPHeaderField: "X-API-KEY")
        
        URLSession.shared.dataTask(with: request) { data, _, err in
            if let err = err {
                completion(nil, err)
                return
            }
            
            guard let data = data else {
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let objects = try decoder.decode(T.self, from: data)
                completion(objects, nil)
            } catch {
                completion(nil, error)
            }
        }
        .resume()
    }
    
}

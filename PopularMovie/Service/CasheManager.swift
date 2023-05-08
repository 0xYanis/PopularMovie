//
//  CasheManager.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 08.05.2023.
//

import Foundation

final class CacheManager {
    
    static let shared = CacheManager()
    
    private let cache = NSCache<NSString, AnyObject>()
    
    func saveObject(_ object: AnyObject, forKey key: String) {
        cache.setObject(object, forKey: key as NSString)
    }
    
    func getObject(forKey key: String) -> AnyObject? {
        cache.object(forKey: key as NSString)
    }
}

//
//  Favorite+CoreDataProperties.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 18.02.2023.
//
//

import Foundation
import CoreData


public class Favorite: NSManagedObject {}

extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite")
    }

    @NSManaged public var image: String?
    @NSManaged public var title: String?
    @NSManaged public var year: Int16
    @NSManaged public var isFavorite: Bool

}

extension Favorite : Identifiable {

}

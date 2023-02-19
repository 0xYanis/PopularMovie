//
//  DataStoreManager.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 18.02.2023.
//

import Foundation
import CoreData

class DataStoreManager {
	
	
	static let shared = DataStoreManager()
	
	
	lazy var viewContext: NSManagedObjectContext = persistentContainer.viewContext
	
	// MARK: - Persistent Container
	lazy var persistentContainer: NSPersistentContainer = {
		let container = NSPersistentContainer(name: "DataBaseModel")
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
		return container
	}()
	
	// MARK: - CRUD
	func saveContext () {
		if viewContext.hasChanges {
			do {
				try viewContext.save()
			} catch {
				let nserror = error as NSError
				fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
			}
		}
	}
	
	
	func saveFilm(image: String, isFavorite: Bool, title: String, year: Int16) -> Favorite? {
		if let entity = NSEntityDescription.entity(forEntityName: "Favorite", in: viewContext) {
			let films = NSManagedObject(entity: entity, insertInto: viewContext)
			films.setValue(image, forKeyPath: "image")
			films.setValue(isFavorite, forKeyPath: "isFavorite")
			films.setValue(title, forKeyPath: "title")
			films.setValue(year, forKeyPath: "year")
			do {
				try viewContext.save()
				return films as? Favorite
			} catch let error as NSError {
				print("Could not save. \(error), \(error.userInfo)")
				return nil
			}
		} else {
			return nil
		}
	}
	
	
	func updateFilm(image: String, isFavorite: Bool, title: String, year: Int16, favorite: Favorite) {
		do {
			favorite.setValue(image, forKey: "image")
			favorite.setValue(isFavorite, forKey: "isFavorite")
			favorite.setValue(title, forKey: "title")
			favorite.setValue(year, forKey: "year")
			
			do {
				try viewContext.save()
			} catch let error as NSError  {
				print("Could not save \(error), \(error.userInfo)")
			}
		}
	}
	
	
	func deleteFilm(key: String, value: String) -> [Favorite]? {
		let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favorite")
		do {
			let films = try viewContext.fetch(fetchRequest)
			if films.count > 0 {
				var arrRemovedFilms = [Favorite]()
				for film in films {
					if film.value(forKey: key) as? String == value {
						viewContext.delete(film)
					}
					try viewContext.save()
					arrRemovedFilms.append(film as! Favorite)
				}
				return arrRemovedFilms
			} else {
				return nil
			}
		} catch let error as NSError {
			print("Could not fetch. \(error), \(error.userInfo)")
			return nil
		}
	}
	
	
	func fetchAllFilms() -> [Favorite]? {
		let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favorite")
		do {
			let films = try viewContext.fetch(fetchRequest)
			return films as? [Favorite]
		} catch let error as NSError {
			print("Could not fetch. \(error), \(error.userInfo)")
			return nil
		}
	}
	
	
	func isFavoriteFilm(title: String) -> Bool {
		let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favorite")
		fetchRequest.predicate = NSPredicate(format: "title == %@" ,title)
		do {
			let results = try viewContext.fetch(fetchRequest)
			if results.count > 0 {
				return true
			} else {
				return false
			}
		} catch {
			return false
		}
	}
	
	
	func deleteAllFilms(entity: String) {
		let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entity) as! NSFetchRequest<any NSFetchRequestResult>
		let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
		do {
			try viewContext.execute(deleteRequest)
			try viewContext.save()
		} catch {
			print ("There was an error")
		}
	}
}

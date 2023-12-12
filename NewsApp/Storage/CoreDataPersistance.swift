//
//  CoreDataPersistance.swift
//  NewsApp
//
//  Created by Ahmed on 11/12/2023.
//

import Foundation
import CoreData
import UIKit

// MARK: - Core Data stack
class DBManager {
    private var viewContext: NSManagedObjectContext!
    static let shared = DBManager()
    init() {
        viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
     func add<T: NSManagedObject>(_ type: T.Type) -> T? {
        guard let entityName = T.entity().name else {return nil}
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: viewContext) else {return nil}
        let object = T(entity: entity, insertInto: viewContext)
        return object
    }
    
    func add<T: NSManagedObject>(_ type: T.Type, attribute: String, value: Any) -> T? {
        if !isObjectExists(type, attribute: attribute, value: value) {
            guard let entityName = T.entity().name else { return nil }
            guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: viewContext) else { return nil }
            let object = T(entity: entity, insertInto: viewContext)
            object.setValue(value, forKey: attribute)
            return object
        } else {
            return nil // Item already exists
        }
    }

    func fetch<T: NSManagedObject>(_ type: T.Type) -> [T] {
        let request = T.fetchRequest()
        do {
            let result = try viewContext.fetch(request)
            return result as! [T]
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
        func save() {
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
        
    private func isObjectExists<T: NSManagedObject>(_ type: T.Type, attribute: String, value: Any) -> Bool {
        let request = T.fetchRequest()
        request.predicate = NSPredicate(format: "%K == %@", argumentArray: [attribute, value])
        do {
            let count = try viewContext.count(for: request)
            return count > 0
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
}

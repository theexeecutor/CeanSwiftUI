//
//  CoreDataStorage.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 26/05/26.
//

import CoreData

final class CoreDataStorage: DatabaseService {
    typealias Model = NSManagedObject
    
    var coreDataStack: CoreDataStack
    init(coreDataStack: CoreDataStack = .shared) {
        self.coreDataStack = coreDataStack
    }
    
    
    func save(_ object: NSManagedObject) async throws {
        if object.managedObjectContext !== coreDataStack.context {
            
        }
        
        
    }
    
    func fetchAll(predicate: Predicate<NSManagedObject>) async throws -> [NSManagedObject] {
        
        
        return []
    }
    
    func delete(_ object: NSManagedObject) async throws {
        
    }
    
    func deleteAll(predicate: Predicate<NSManagedObject>? = nil) async throws {
        
    }
}

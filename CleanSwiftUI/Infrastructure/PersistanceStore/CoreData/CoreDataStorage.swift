//
//  CoreDataStorage.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 26/05/26.
//

import CoreData

final class CoreDataStorage: DatabaseService {
    private let coreDataStack: CoreDataStack
    init(coreDataStack: CoreDataStack = .shared) {
        self.coreDataStack = coreDataStack
    }
    
    var context: AnyObject? {
        coreDataStack.context
    }
    
    // add parameter for merge policy
    func save<T: Persistable>(_ object: T) async throws {
        guard let object = object as? NSManagedObject else { throw DatabaseError.modelError }
        let context = object.managedObjectContext ?? coreDataStack.context
        do {
            if context.hasChanges { // Check if there is uncommited changes
                try context.save()
            }
        } catch {
            let userInfo = (error as NSError).userInfo
            // handling merge conflicts
            if let conflicts = userInfo[NSPersistentStoreSaveConflictsErrorKey] as? [NSMergeConflict] {
                for conflict in conflicts {
                    // handle each one by one
                }
            } else {
                throw error
            }
        }
    }
    
    @available(iOS 17, *)
    func fetchAll<T: Persistable>(predicate: Predicate<T>?) async throws -> [T] {
        guard let T = T.self as? NSManagedObject.Type else { throw DatabaseError.modelError }
        
        let request = T.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        if let predicate {
            let nsPredicate = NSPredicate(predicate)
            request.predicate = nsPredicate
        }
        let result = try coreDataStack.context.fetch(request) as! [T]
        
        return result
    }
    
    func delete<T: Persistable>(_ object: T) async throws {
        guard let object = object as? NSManagedObject else { throw DatabaseError.modelError }
        let context = object.managedObjectContext ?? coreDataStack.context
        context.delete(object)
        try context.save()
    }
    
    @available(iOS 17, *)
    func deleteAll<T: Persistable>(predicate: Predicate<T>? = nil) async throws {
        guard let T = T.self as? NSManagedObject.Type else { throw DatabaseError.modelError }
        let request = T.fetchRequest()
        let context = coreDataStack.context
        if let predicate {
            let nsPredicate = NSPredicate(predicate)
            request.predicate = nsPredicate
        }
        let result = try context.fetch(request) as! [NSManagedObject]
        for item in result {
            context.delete(item)
        }
        try context.save()
    }
}

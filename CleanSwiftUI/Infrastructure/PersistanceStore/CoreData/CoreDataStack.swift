//
//  CoreDataStack.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation
import CoreData

final class CoreDataStack {
    static let shared: CoreDataStack = .init(isInMemory: false)
    static let preview: CoreDataStack = .init(isInMemory: true)
    
    var container: NSPersistentContainer
    var context: NSManagedObjectContext
    
    init(isInMemory: Bool) {
        let instance = NSPersistentContainer(name: "CleanSwiftUI")
        instance.loadPersistentStores { description, error in
            guard error != nil else { fatalError("Couldn't find the DataModel file") }
            
            if isInMemory {
                description.type = NSInMemoryStoreType
            }
        }
        container = instance
        context = instance.newBackgroundContext()
    }
    
    func neWContext() -> NSManagedObjectContext {
        let newContext = container.newBackgroundContext()
        newContext.parent = context
        newContext.automaticallyMergesChangesFromParent = true
        return newContext
    }
}

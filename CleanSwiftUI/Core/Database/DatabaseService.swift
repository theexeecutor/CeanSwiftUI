//
//  DatabaseService.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation

protocol Persistable: NSObject {
    var id: String { get }
}

protocol DatabaseService {
    func save<T: Persistable>(_ object: T) async throws
    @available(iOS 17, *)
    func fetchAll<T: Persistable>(predicate: Predicate<T>?) async throws -> [T]
    func delete<T: Persistable>(_ object: T) async throws
    @available(iOS 17, *)
    func deleteAll<T: Persistable>(predicate: Predicate<T>?) async throws
}


enum DatabaseError: Error {
    case modelError
    case decodingError
}

enum DatabaseMergePolicy {
    case memory
    case disk
    case override
    case none
}

//
//  DatabaseService.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation

protocol DatabaseService {
    associatedtype Model
    
    func save(_ object: Model) async throws
    func fetchAll(predicate: Predicate<Model>?) async throws -> [Model]
    func delete(_ object: Model) async throws
    func deleteAll(predicate: Predicate<Model>?) async throws
}


enum DatabaseError {
    case modelError
    case decodingError
}

//
//  DatabaseService.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation

protocol DatabaseService {
    func fetchAll<T>() async throws -> [T]
    func save() async throws
}

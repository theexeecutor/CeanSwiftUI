//
//  LocalProductRepository.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 23/05/26.
//

import Foundation


protocol ProductLocalDataSource {
    func fetchProducts(criteria: ProductFilterCriteria) async throws -> [Product]
}

struct ProductLocalDataSourceImpl: ProductLocalDataSource {
    let localDB: DatabaseService
    
    func fetchProducts(criteria: ProductFilterCriteria) async throws -> [Product] {
        // fetch database item
    }
}

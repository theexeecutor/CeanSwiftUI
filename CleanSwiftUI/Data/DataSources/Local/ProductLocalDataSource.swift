//
//  ProductListLocalDataSource.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 23/05/26.
//

import Foundation


protocol ProductListLocalDataSource {
    func fetchProducts(criteria: ProductFilterCriteria) async throws -> [Product]
}

struct ProductListLocalDataSourceImpl: ProductListLocalDataSource {
    let localDB: DatabaseService
    
    func fetchProducts(criteria: ProductFilterCriteria) async throws -> [Product] {
        // fetch database item
        return []
    }
}

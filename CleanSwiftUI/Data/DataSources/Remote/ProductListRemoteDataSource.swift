//
//  ProductListRemoteDataSource.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 23/05/26.
//

import Foundation

protocol ProductListRemoteDataSource {
    func fetchProducts(criteria: ProductFilterCriteria) async throws -> [Product]
}

struct ProductListRemoteDataSourceImpl: ProductListRemoteDataSource {
    let apiClient: NetworkEngine
    
    func fetchProducts(criteria: ProductFilterCriteria) async throws -> [Product] {
        // fetch from remote server.
        
        return []
    }
}


struct MockProductListRemoteDataSource: ProductListRemoteDataSource {
    
    func fetchProducts(criteria: ProductFilterCriteria) async throws -> [Product] {
        guard let url = Bundle.main.url(forResource: "Products", withExtension: "json") else { return [] }
        let data = try Data(contentsOf: url)
        let products = try JSONDecoder().decode([ProductDTO].self, from: data)
        return products.map({ $0.toEntity() })
    }
}

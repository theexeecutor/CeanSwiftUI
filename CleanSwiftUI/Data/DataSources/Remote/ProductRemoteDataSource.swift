//
//  RemoteProductRepository.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 23/05/26.
//

import Foundation

protocol ProductRemoteDataSource {
    func fetchProducts(criteria: ProductFilterCriteria) async throws -> [Product]
}

struct ProductRemoteDataSourceImpl: ProductRemoteDataSource {
    let apiClient: NetworkEngine
    
    func fetchProducts(criteria: ProductFilterCriteria) async throws -> [Product] {
        let endpoint = 
        apiClient.request(endpoint: <#T##any APIEndpoint#>)
    }
}

//
//  ProductListRepositoryImpl.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 23/05/26.
//

import Foundation

class ProductListRepositoryImpl: ProductListRepository {
    private let localDataSource: ProductListLocalDataSource
    private let remoteDataSource: ProductListRemoteDataSource
    
    init(localDataSource: ProductListLocalDataSource, remoteDataSource: ProductListRemoteDataSource) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
    
    

    func fetchProducts(criteria: ProductFilterCriteria) async throws -> [Product] {
        try await remoteDataSource.fetchProducts(criteria: criteria)
    }
}

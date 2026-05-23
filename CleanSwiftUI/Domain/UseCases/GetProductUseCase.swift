//
//  ProductListUseCase.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 23/05/26.
//

import Foundation

struct GetProductUseCase {
    let repository: ProductRepository
    
    func execute(criteria: ProductFilterCriteria) async throws -> [Product] {
        try await repository.fetchProducts(criteria: criteria)
    }
}

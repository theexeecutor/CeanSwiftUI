//
//  ProductListRepository.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 23/05/26.
//

import Foundation


protocol ProductListRepository {
    func fetchProducts(criteria: ProductFilterCriteria) async throws -> [Product]
}

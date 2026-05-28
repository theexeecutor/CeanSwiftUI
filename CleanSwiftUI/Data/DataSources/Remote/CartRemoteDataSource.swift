//
//  CartRemoteDataSource.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 23/05/26.
//

import Foundation

protocol CartRemoteDataSource {
    func getCart() async throws -> Cart
    func saveCart(_ cart: Cart) async throws -> Cart
}

class CartRemoteDataSourceImpl: CartRemoteDataSource {
    // network client
    
    func getCart() async throws -> Cart {
        if #available(iOS 16.0, *) {
            try await Task.sleep(for: .seconds(1))
        }
        return Cart(id: "remote", item: [], timeStamp: Date())
    }
    
    func saveCart(_ cart: Cart) async throws -> Cart {
        let dto = CartDTO()
        // map cart to cart dto.
        if #available(iOS 16.0, *) {
            try await Task.sleep(for: .seconds(1))
        } else {
            // Fallback on earlier versions
        }
        return cart
    }
}

//
//  CartLocalDataSource.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 23/05/26.
//

import Foundation
import CoreData


protocol CartLocalDataSource {
    func loadCart() async throws -> Cart?
    func saveCartItem(_ item: CartItem) async throws -> Cart
}


final class CartLocalDataSourceImpl: CartLocalDataSource {
    let localDatabase: any DatabaseService
    
    init(localDatabase: any DatabaseService) {
        self.localDatabase = localDatabase
    }
    
    func loadCart() async throws -> Cart? {
        if #available(iOS 17, *) {
            let cart: [CartEntity] = try await localDatabase.fetchAll(predicate: nil)
            return cart.first?.toEntity()
        } else {
            // Handle backward compatibility (Future)
            return Cart(id: "Invalid", item: [], timeStamp: Date())
        }
    }
    
    func saveCartItem(_ item: CartItem) async throws -> Cart {
        if #available(iOS 17.0, *) {
            let cart = try await getORCreateNewCart()
            let items = cart.cartItems?.allObjects as! [CartItemEntity]
            if let first = items.first(where: { $0.id == item.id }) {
                if item.count == 0 {
                    try await localDatabase.delete(first)
                } else {
                    first.count = Int16(item.count)
                }
            } else {
                let entity = CartItemEntity()
                let product = ProductEntity()
                product.id = item.product.id
                product.title = item.product.title
                product.price = NSDecimalNumber(decimal: item.product.price)
                try await localDatabase.save(product)
                entity.id = item.id
                entity.product = product
                entity.count = Int16(item.count)
                try await localDatabase.save(entity)
                cart.addToCartItems(entity)
            }
        } else {
            fatalError()
        }
    }
    
    @available(iOS 17.0, *)
    private func getORCreateNewCart() async throws -> CartEntity {
        let cart: [CartEntity] = try await localDatabase.fetchAll(predicate: nil)
        if let first = cart.first {
            return first
        }
        
        let cartEntity = CartEntity()
        cartEntity.id = UUID().uuidString
        cartEntity.timeStamp = Date()
        
        try await localDatabase.save(cartEntity)
        return cartEntity
    }
}

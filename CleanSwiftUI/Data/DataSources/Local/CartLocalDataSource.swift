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
    private let localDatabase: any DatabaseService
    lazy var context: NSManagedObjectContext = {
        localDatabase.context as! NSManagedObjectContext
    }()
    
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
            var items = cart.cartItems?.allObjects as! [CartItemEntity]
            if let first = items.first(where: { $0.id == item.id }) {
                if item.count == 0 {
                    try await localDatabase.delete(first)
                } else {
                    first.count = Int16(item.count)
                }
            } else {
                let cartItem = CartItemEntity(context: context)
                let product = ProductEntity(context: context)
                product.id = item.product.id
                product.title = item.product.title
                product.price = NSDecimalNumber(decimal: item.product.price)
                cartItem.id = item.id
                cartItem.product = product
                cartItem.count = Int16(item.count)
                cart.addToCartItems(cartItem)
                items = cart.cartItems?.allObjects as! [CartItemEntity]
                try await localDatabase.save(cartItem)
            }
            
            return Cart(id: cart.id, item: items.map({ $0.toEntity() }), timeStamp: cart.timeStamp)
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
        let cartEntity = CartEntity(context: context)
        cartEntity.id = UUID().uuidString
        cartEntity.timeStamp = Date()
        
        try await localDatabase.save(cartEntity)
        return cartEntity
    }
}

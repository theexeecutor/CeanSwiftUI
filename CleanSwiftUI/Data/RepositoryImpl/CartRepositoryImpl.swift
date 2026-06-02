//
//  CartRepositoryImpl.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 27/05/26.
//

import Foundation

final class CartRepositoryImpl: CartRepository {
    private let remoteDataSource: CartRemoteDataSource
    private let localDataSource: CartLocalDataSource
//     sync engine
//    private let syncEngine: CartSyncEngine
//    for the offline first architecture it will best to use sync engine instead of remote data source.
    
    init(remoteDataSource: CartRemoteDataSource, localDataSource: CartLocalDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func getCart() -> AsyncThrowingStream<Cart, Error> {
        
        return AsyncThrowingStream { continuation in
            Task {
                let cart = try await localDataSource.loadCart()
                if cart != nil {
                    continuation.yield(cart!)
                }
                
                let remoteCart = try await remoteDataSource.getCart()
                // compare and update the cart
                let updatedCart = mergeCart(remoteCart, cart)
                
                continuation.yield(updatedCart)
                
                // mark finish
                continuation.finish()
            }
        }
    }
    
    func updateCartItem(_ item: CartItem) async throws -> Cart {
        let cart = try await localDataSource.saveCartItem(item)
        
        Task {
            try await remoteDataSource.saveCart(cart)
        }
        return cart
    }
    
    private func mergeCart(_ remote: Cart, _ local: Cart?) -> Cart {
        guard let local = local else { return remote }
        // Complex logic can be implemented here.
//        if remote.timeStamp < local.timeStamp {
//            return local
//        } else {
//            return remote
//        }
        return local
    }
    
}

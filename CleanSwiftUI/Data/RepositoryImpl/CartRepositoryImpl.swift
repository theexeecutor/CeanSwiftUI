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
    // sync engine
    
    init(remoteDataSource: CartRemoteDataSource, localDataSource: CartLocalDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func getCart() async throws -> Cart { // change to async stream // make it finish when last call done. local , then api update , then done.
        
    }
    
    func updateCartItem(_ item: CartItem) async throws -> Cart {
        <#code#>
    }
    
    
}

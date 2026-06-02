//
//  UpdateCartItemUseCase.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 23/05/26.
//

import Foundation


struct UpdateCartItemUseCase {
    let repository: CartRepository
    
    func execute(_ item: CartItem) async throws -> Cart {
        return try await repository.updateCartItem(item)
    }
}

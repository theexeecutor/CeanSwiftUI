//
//  UpdateCartItemUseCase.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 23/05/26.
//

import Foundation


struct UpdateCartItemUseCase {
    let repository: CartRepository
    
    func execute(_ cart: CartItem) async throws -> Cart {
        
        
        return Cart(id: "", item: [], timeStamp: Date())
    }
}

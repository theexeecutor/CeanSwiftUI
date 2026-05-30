//
//  CartRepository.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 23/05/26.
//

import Foundation


protocol CartRepository {
    func getCart() -> AsyncThrowingStream<Cart, Error>
    func updateCartItem(_ item: CartItem) async throws -> Cart
}

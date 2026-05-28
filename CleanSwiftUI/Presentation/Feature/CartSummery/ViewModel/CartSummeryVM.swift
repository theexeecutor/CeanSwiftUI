//
//  CartSummeryVM.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 27/05/26.
//

import SwiftUI


@Observable
class CartSummeryVM {
    var cart: Cart = Cart()
    @ObservationIgnored
    private let getCartUseCase: GetCartUseCase
    @ObservationIgnored
    private let updateCartItemUseCase: UpdateCartItemUseCase
    
    init(cart: Cart, getCartUseCase: GetCartUseCase, updateCartItemUseCase: UpdateCartItemUseCase) {
        self.cart = cart
        self.getCartUseCase = getCartUseCase
        self.updateCartItemUseCase = updateCartItemUseCase
    }
    
    
    func fetchCart() {
        // initiate Cart
        Task {
            do {
                let cart = try await getCartUseCase.execute()
                self.cart = cart
            } catch {
                // Handle error.
            }
        }
    }
}

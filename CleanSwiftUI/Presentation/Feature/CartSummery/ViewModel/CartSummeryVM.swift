//
//  CartSummeryVM.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 27/05/26.
//

import SwiftUI
import CoreData


@Observable
class CartSummeryVM {
    var cart: Cart
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
                let stream = getCartUseCase.execute()
                for try await cart in stream {
                    self.cart = cart
                }
            } catch {
                // Handle error.
            }
        }
    }
    
    func updateCartItem(item: CartItem, isAdded: Bool) {
        if isAdded {
            item.count += 1
        } else {
            // update and swiftui redraw if full cart replaced with new cart
//            if item.count == 0 {
//
//            }
            
            item.count -= 1
        }
        Task {
            let cart = try await updateCartItemUseCase.execute(item)
            // is it required to update cart?
        }
    }
}

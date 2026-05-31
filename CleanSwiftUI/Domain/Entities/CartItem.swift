//
//  CartItem.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation

class CartItem: Identifiable {
    let id: String
    let product: Product
    var count: Int
    
    init(id: String, product: Product, count: Int) {
        self.id = id
        self.product = product
        self.count = count
    }
}

extension CartItem: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: CartItem, rhs: CartItem) -> Bool {
        return lhs.id == rhs.id
    }
}

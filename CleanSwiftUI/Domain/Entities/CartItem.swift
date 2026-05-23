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

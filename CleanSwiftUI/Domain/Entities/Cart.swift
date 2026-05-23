//
//  Cart.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation

class Cart: Identifiable {
    var id: String = UUID().uuidString
    var item: [CartItem] = []
}

extension Cart: Hashable, Equatable {
    static func == (lhs: Cart, rhs: Cart) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

//
//  CartRepository.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 23/05/26.
//

import Foundation


protocol CartRepository {
    func getCart() async throws -> Cart
    func updateCart(_ item: CartItem) async throws
}

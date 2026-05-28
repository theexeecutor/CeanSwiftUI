//
//  GetCartUseCase.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 23/05/26.
//

import Foundation

struct GetCartUseCase {
    let repository: CartRepository
    init(_ repository: CartRepository) {
        self.repository = repository
    }
    func execute() async throws-> Cart {
        Cart()
    }
}

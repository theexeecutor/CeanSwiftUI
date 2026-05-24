//
//  CheckoutError.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 24/05/26.
//

import Foundation


enum CheckoutError: Error, LocalizedError {
    case emptyCart
    case itemOutOfStock(productId: String)
    case couponExpired(code: String)
    case paymentDeclined(reason: String)
    // ..
    
    // Add domain-specific descriptions that aren't tied to UI formatting
    var errorDescription: String? {
        switch self {
        case .emptyCart: return "Cannot process checkout with an empty cart."
        case .itemOutOfStock(let id): return "Product \(id) is no longer available."
        case .couponExpired(let code): return "The coupon '\(code)' has expired."
        case .paymentDeclined(let reason): return "Payment failed: \(reason)"
        }
    }
}

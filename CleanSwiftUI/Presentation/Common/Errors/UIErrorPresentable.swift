//
//  UIErrorPresentable.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 24/05/26.
//

import Foundation

struct UIErrorPresentable: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let message: String
    let actionableRetry: (() -> Void)?
    
    // Custom equate helper to make view updates clean
    static func == (lhs: UIErrorPresentable, rhs: UIErrorPresentable) -> Bool {
        lhs.id == rhs.id
    }
    
    /// Maps generic network/domain errors into beautiful, consumer-safe text
    init(from error: Error, retryAction: (() -> Void)? = nil) {
        self.actionableRetry = retryAction
        
        if let checkoutError = error as? CheckoutError {
            self.title = "Checkout Issue"
            self.message = checkoutError.localizedDescription
        } else if let networkError = error as? NetworkError {
            self.title = "Connection Lost"
            switch networkError {
            case .noInternetConnection:
                self.message = "Please check your network settings and try again."
            default:
                self.message = "Our servers are running slow. Please try again shortly."
            }
        } else {
            self.title = "Something Went Wrong"
            self.message = "An unexpected error occurred. Please contact support if this persists."
        }
    }
}

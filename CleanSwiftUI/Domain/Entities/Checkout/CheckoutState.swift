//
//  CheckoutState.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 24/05/26.
//

import Foundation


enum CheckoutState: Equatable {
    case idle
    case validatingCart
    case processingPayment
    case finalizingOrder
    case success(transactionId: String)
    case failure(reason: String)
}

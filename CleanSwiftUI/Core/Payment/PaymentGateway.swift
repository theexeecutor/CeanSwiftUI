//
//  PaymentGateway.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation


protocol PaymentGateway {
    func processPayment(_ intent: PaymentIntentDTO) async -> TransactionDTO
}

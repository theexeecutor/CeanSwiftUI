//
//  CustomPaymentGateway.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation


// Design Your gateway with 3rd party sdk
// Generally for payment this is not needed, you can use directly the Payment SDK. But
// This is something I want to have it. so that your are using any other 3rd party sdk for any purpose
// You can use this kind of wrapper class, so it will easy to mock and test.

class CustomPaymentGateway: PaymentGateway {
    func processPayment(_ intent: PaymentIntentDTO) async -> TransactionDTO {
        
        
        return TransactionDTO()
    }
}

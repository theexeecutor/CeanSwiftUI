//
//  Product.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation


struct Product: Identifiable {
    let id: String
    var title: String
    var description: String
    var images: [String]
    var price: Decimal
    var discount: Decimal
}

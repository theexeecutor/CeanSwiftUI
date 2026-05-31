//
//  ProductDTO.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 23/05/26.
//

import Foundation


struct ProductDTO: Decodable {
    let id: String
    var title: String
    var description: String?
    var images: [String]
    var price: Decimal
    var discount: Decimal
    
    func toEntity() -> Product {
        Product(id: id, title: title, description: description ?? "", images: images, price: price, discount: discount)
    }
}

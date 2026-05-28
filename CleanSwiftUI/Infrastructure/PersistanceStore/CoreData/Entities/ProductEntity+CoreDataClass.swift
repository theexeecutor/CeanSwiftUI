//
//  ProductEntity+CoreDataClass.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 26/05/26.
//
//

import Foundation
import CoreData

typealias ProductEntityCoreDataClassSet = NSSet

@objc(ProductEntity)
public class ProductEntity: NSManagedObject {

}

extension ProductEntity: Persistable {
    
    // To Entity
    func toEntity() -> Product {
        Product(id: id,
                title: title ?? "",
                description: "",
                images: [],
                price: price.decimalValue,
                discount: 0.0)
    }
}

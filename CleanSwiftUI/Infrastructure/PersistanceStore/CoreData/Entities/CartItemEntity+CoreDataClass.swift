//
//  CartItemEntity+CoreDataClass.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 26/05/26.
//
//

import Foundation
import CoreData

typealias CartItemEntityCoreDataClassSet = NSSet

@objc(CartItemEntity)
public class CartItemEntity: NSManagedObject {

}

extension CartItemEntity: Persistable {
    
    // To Entity
    func toEntity() -> CartItem {
        CartItem(id: id, product: product.toEntity(), count: Int(count))
    }
}

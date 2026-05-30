//
//  CartEntity+CoreDataClass.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 26/05/26.
//
//

import Foundation
import CoreData

typealias CartEntityCoreDataClassSet = NSSet

@objc(CartEntity)
public class CartEntity: NSManagedObject {

}

extension CartEntity: Persistable {
    
    // to entity
    func toEntity() -> Cart {
        let cartItems = self.cartItems?.allObjects as? [CartItemEntity] ?? []
        return Cart(id: id, item: cartItems.map({ $0.toEntity() }), timeStamp: timeStamp)
    }
}

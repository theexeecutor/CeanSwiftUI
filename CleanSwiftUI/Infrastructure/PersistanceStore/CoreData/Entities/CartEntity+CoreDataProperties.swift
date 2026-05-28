//
//  CartEntity+CoreDataProperties.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 26/05/26.
//
//

import Foundation
import CoreData


typealias CartEntityCoreDataPropertiesSet = NSSet

extension CartEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartEntity> {
        return NSFetchRequest<CartEntity>(entityName: "CartEntity")
    }

    @NSManaged public var id: String
    @NSManaged public var timeStamp: Date
    @NSManaged public var cartItems: NSSet?

}

// MARK: Generated accessors for cartItems
extension CartEntity {

    @objc(addCartItemsObject:)
    @NSManaged public func addToCartItems(_ value: CartItemEntity)

    @objc(removeCartItemsObject:)
    @NSManaged public func removeFromCartItems(_ value: CartItemEntity)

    @objc(addCartItems:)
    @NSManaged public func addToCartItems(_ values: NSSet)

    @objc(removeCartItems:)
    @NSManaged public func removeFromCartItems(_ values: NSSet)

}

extension CartEntity : Identifiable {

}

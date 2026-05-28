//
//  CartItemEntity+CoreDataProperties.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 26/05/26.
//
//

import Foundation
import CoreData


typealias CartItemEntityCoreDataPropertiesSet = NSSet

extension CartItemEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartItemEntity> {
        return NSFetchRequest<CartItemEntity>(entityName: "CartItemEntity")
    }

    @NSManaged public var count: Int16
    @NSManaged public var id: String
    @NSManaged public var product: ProductEntity

}

extension CartItemEntity : Identifiable {

}

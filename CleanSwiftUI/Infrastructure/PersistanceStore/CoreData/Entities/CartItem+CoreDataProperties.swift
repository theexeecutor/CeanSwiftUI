//
//  CartItem+CoreDataProperties.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 26/05/26.
//
//

import Foundation
import CoreData


typealias CartItemCoreDataPropertiesSet = NSSet

extension CartItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartItem> {
        return NSFetchRequest<CartItem>(entityName: "CartItem")
    }

    @NSManaged public var id: String?
    @NSManaged public var count: Int16
    @NSManaged public var product: Product?

}

extension CartItem : Identifiable {

}

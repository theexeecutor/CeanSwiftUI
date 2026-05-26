//
//  Product+CoreDataProperties.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 26/05/26.
//
//

import Foundation
import CoreData


typealias ProductCoreDataPropertiesSet = NSSet

extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var price: NSDecimalNumber?

}

extension Product : Identifiable {

}

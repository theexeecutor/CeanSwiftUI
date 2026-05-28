//
//  ProductEntity+CoreDataProperties.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 26/05/26.
//
//

import Foundation
import CoreData


typealias ProductEntityCoreDataPropertiesSet = NSSet

extension ProductEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductEntity> {
        return NSFetchRequest<ProductEntity>(entityName: "ProductEntity")
    }

    @NSManaged public var id: String
    @NSManaged public var price: NSDecimalNumber
    @NSManaged public var title: String?

}

extension ProductEntity : Identifiable {

}

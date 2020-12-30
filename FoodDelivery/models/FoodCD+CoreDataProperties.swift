//
//  FoodCD+CoreDataProperties.swift
//  FoodDelivery
//
//  Created by Akira Watanabe on 12/30/20.
//
//

import Foundation
import CoreData


extension FoodCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodCD> {
        return NSFetchRequest<FoodCD>(entityName: "FoodCD")
    }

    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var price: String?

}

extension FoodCD : Identifiable {

}

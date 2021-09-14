//
//  ProductItem+CoreDataProperties.swift
//  ECommerce
//
//  Created by M1066900 on 14/09/21.
//
//

import Foundation
import CoreData


extension ProductItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductItem> {
        return NSFetchRequest<ProductItem>(entityName: "ProductItem")
    }

    @NSManaged public var prodBrand: String?
    @NSManaged public var prodCategory: String?
    @NSManaged public var prodDescription: String?
    @NSManaged public var prodID: String?
    @NSManaged public var prodImage: String?
    @NSManaged public var prodName: String?
    @NSManaged public var prodPrice: String?
    @NSManaged public var prodRatings: Double
    @NSManaged public var cartAdded: Bool
    @NSManaged public var wishlistAdded: Bool

}

extension ProductItem {

    
//creating a product item in core data
    static func createProduct(name: String, productId: String, image: String, category: String, brand: String, rating: Double, price: String, cartAdded: Bool, wishlistAdded: Bool, descrip: String, context: NSManagedObjectContext) -> ProductItem {

        

        let entity = ProductItem(context: context)

        entity.prodName = name

        entity.prodID = productId

        entity.prodBrand = brand

        entity.prodCategory = category

        entity.prodImage = image

        entity.prodRatings = rating

        entity.prodPrice = price

        entity.wishlistAdded = false

        entity.prodDescription = descrip

        entity.cartAdded = false

        //entity.countInCart = 0

        return entity

    }

}


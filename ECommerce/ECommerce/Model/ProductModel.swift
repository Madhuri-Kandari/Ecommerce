//
//  ProductModel.swift
//  ECommerce
//
//  Created by M1066900 on 07/09/21.
//

import Foundation

// MARK: - Welcome
struct Products: Codable {
    let products: [Product]
}

// MARK: - Product
struct Product: Codable {
    let productID, price: String
    let ratings: Double
    let image: String
    let category: String
    let name: String
    let brand: String
    let descrip: String
    var cartAdded: Bool = false
    var wishlistAdded: Bool = false
}

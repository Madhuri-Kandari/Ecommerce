//
//  CoreDataRepo.swift
//  ECommerce
//
//  Created by M1066900 on 14/09/21.
//

import UIKit
import CoreData

class CoreDataRepo {
    
    var products = [Product]()
    var productsItem: [ProductItem]?
    
    let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    func groupingCategories()->[String?: [ProductItem]] {
        
        let categoryDictionary = Dictionary(grouping: productsItem!) { $0.prodCategory }
        return categoryDictionary
    }
    
    func fetchProducts() {
        do{
            let dataFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductItem")
            do {
                productsItem = try context.fetch(dataFetch) as? [ProductItem]
            } catch {
                print("Error fetching data")
            }

            if let data = productsItem {
                if data.count == 0 {
                    productsItem = try context.fetch(ProductItem.fetchRequest())
                    do{
                        try context.save()
                    }
                    catch{
                        print(error.localizedDescription)
                    }
                }
            }
            
            if let data = productsItem {
                data.forEach { product in
                    if product.cartAdded == true {
                        ProductDetailViewController.cartList.append(product)
                    }
                    if product.wishlistAdded == true {
                        ProductDetailViewController.wishlist.append(product)
                    }
                }
            }
            
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func insertProductDetails(products: [Product]) {

                context.performAndWait {

                    products.forEach { product in

                        _ = ProductItem.createProduct(name: product.name, productId: product.productID, image: product.image, category: product.category, brand: product.brand, rating: product.ratings, price: product.price, cartAdded: product.cartAdded, wishlistAdded: product.wishlistAdded, descrip: product.descrip, context: context)
                    }

                    
                    if context.hasChanges {

                        do {
                            try context.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                    } else {
                        
                    }

                }

            }
    
}

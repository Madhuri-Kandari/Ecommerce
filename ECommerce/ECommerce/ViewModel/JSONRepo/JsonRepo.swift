//
//  JsonRepo.swift
//  ECommerce
//
//  Created by M1066900 on 14/09/21.
//

import UIKit

class JsonRepo {
    
    let serviceRequestData = ServiceRequest()
    
    var products = [Product]()
    let coreDataRepo = CoreDataRepo()
    
    func requestingDataFromAPI() {
        serviceRequestData.getDataFromAPI() { [self]
                        success in
                if success {
                    switch self.serviceRequestData.state {
                            case .results(let productsData):
                                self.products = productsData.products
                                coreDataRepo.insertProductDetails(products: products)
                            case .loading:
                                print("loading...")
                            }
                }
                else {
                        print("no data to print")
                }
            }
        }
    
}

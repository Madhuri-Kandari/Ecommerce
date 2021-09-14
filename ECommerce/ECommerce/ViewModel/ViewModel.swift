//
//  ViewModel.swift
//  ECommerce
//
//  Created by M1066900 on 07/09/21.
//

import UIKit
import CoreData

class ViewModel {
    
    let serviceRequestData = ServiceRequest()
    
    var products = [Product]()
    var dictionary = [String?: [ProductItem]]()
    let coreDataRepo = CoreDataRepo()
    let jsonDataRepo = JsonRepo()
    
    func serviceRequestFromCD() {
        jsonDataRepo.requestingDataFromAPI()
        coreDataRepo.fetchProducts()
        self.dictionary = coreDataRepo.groupingCategories()
    }
}

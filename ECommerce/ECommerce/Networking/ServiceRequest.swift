//
//  ServiceRequest.swift
//  ECommerce
//
//  Created by M1066900 on 07/09/21.
//

import UIKit

class ServiceRequest {
    
    typealias DataRequestComplete = (Bool)->Void
    static public let shared = ServiceRequest()
    private(set) var state: State = .loading
    
    enum State {
        case results(Products)
        case loading
    }

//MARK:- reading the local json file function and returning the data to parse
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }

//MARK:- Returning a bool value if the data is parsed or not and changing the state
    private func parse(jsonData: Data)->Bool {
        var success = false
        var newState = State.loading
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(Products.self, from: jsonData)
                if result.products.isEmpty{
                    print("no results...")
                }else {
                    newState = State.results(result)
                }
                success = true
                self.state = newState
            }catch {
                print("JSON error: \(error)")
            }
        return success
    }
    
//MARK:-Getting the data from json
        func getDataFromAPI(completion:@escaping DataRequestComplete) {
            state = .loading
                var isParsedData = false
            if let localData = self.readLocalFile(forName: "products") {
                isParsedData=self.parse(jsonData: localData)
            }
                completion(isParsedData)
            }
    
}

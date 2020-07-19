//
//  APIPet.swift
//  Codegen
//
//  Created by Mário Galvao on 18/07/20.
//  Copyright © 2020 Open Mind House. All rights reserved.
//

import UIKit
import SwaggerClient

protocol PetAPIProtocol {
    
    func getPets(by status: [PetStatus], completion: @escaping (Result<[Pet], APIError>) -> Void)
    
}

class PetAPI: API, PetAPIProtocol {
    
    func getPets(by status: [PetStatus], completion: @escaping (Result<[Pet], APIError>) -> Void) {
        
//        let pet1 = Pet(_id: 1, category: nil, name: "Rex", photoUrls: [], tags: nil, status: .available)
//        let pet2 = Pet(_id: 1, category: nil, name: "Doggie", photoUrls: [], tags: nil, status: .sold)
//        let pet3 = Pet(_id: 1, category: nil, name: "Dolly", photoUrls: [], tags: nil, status: .pending)
//        let pets = [pet1, pet2, pet3]
//        completion(.success(pets))
        
        SwaggerClientAPI.PetAPI.findPetsByStatus(status: status.map { $0.rawValue }) { (response, error) in
            self.handleResponse(response: response, error: error, complete: completion)
        }
    }

}

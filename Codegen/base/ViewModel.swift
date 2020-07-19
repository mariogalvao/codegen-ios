//
//  ViewModel.swift
//  Codegen
//
//  Created by Mário Galvao on 18/07/20.
//  Copyright © 2020 Open Mind House. All rights reserved.
//

import UIKit

class ViewModel {
    
    var petApi: PetAPIProtocol
    
    init() {
        petApi = PetAPI()
    }
    
}

protocol ViewModelProtocol: class {}

extension ViewModelProtocol {}

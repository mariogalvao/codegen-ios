//
//  SearchViewModel.swift
//  Codegen
//
//  Created by Mário Galvao on 18/07/20.
//  Copyright © 2020 Open Mind House. All rights reserved.
//

import UIKit
import SwaggerClient

class SearchViewModel: ViewModel {
    
    private weak var viewControllerDelegate: SearchViewControllerProtocol?
    
    var pets: [Pet] = []
    
    init(viewControllerDelegate: SearchViewControllerProtocol) {
        self.viewControllerDelegate = viewControllerDelegate
    }

}

protocol SearchViewModelProtocol: ViewModelProtocol {
    
    func loadPets()
    func getNumberOfPets() -> Int
    func getPet(for index: Int) -> Pet
    func updateSearchText(text: String)
    func selectPet(index: Int)
    
}

extension SearchViewModel: SearchViewModelProtocol {
    
    func loadPets() {
        petApi.getPets(by: [.available, .pending, .sold]) { (result) in
            switch result {
            case .success(let pets):
                self.pets = pets
                self.viewControllerDelegate?.reloadPets()
            case .failure(let error):
                self.viewControllerDelegate?.alertError(error)
            }
        }
    }
    
    func getNumberOfPets() -> Int {
        return pets.count
    }
    
    func getPet(for index: Int) -> Pet {
        return pets[index]
    }
    
    func updateSearchText(text: String) {
        // TODO
    }
    
    func selectPet(index: Int) {
        // TODO
    }
    
}
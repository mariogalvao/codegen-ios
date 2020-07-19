//
//  ShoppingViewModel.swift
//  Codegen
//
//  Created by Mário Galvao on 18/07/20.
//  Copyright © 2020 Open Mind House. All rights reserved.
//

import UIKit

class ShoppingViewModel: ViewModel {
    
    var viewControllerDelegate: ShoppingViewControllerProtocol
    
    init(viewControllerDelegate: ShoppingViewControllerProtocol) {
        self.viewControllerDelegate = viewControllerDelegate
    }

}

protocol ShoppingViewModelProtocol: ViewModelProtocol {
    
}

extension ShoppingViewModel: ShoppingViewModelProtocol {
    
}

//
//  AddViewModel.swift
//  Codegen
//
//  Created by Mário Galvao on 18/07/20.
//  Copyright © 2020 Open Mind House. All rights reserved.
//

import UIKit

class AddViewModel: ViewModel {
    
    var viewControllerDelegate: AddViewControllerProtocol
    
    init(viewControllerDelegate: AddViewControllerProtocol) {
        self.viewControllerDelegate = viewControllerDelegate
    }

}

protocol AddViewModelProtocol: ViewModelProtocol {
    
}

extension AddViewModel: AddViewModelProtocol {
    
}

//
//  ProfileViewModel.swift
//  Codegen
//
//  Created by Mário Galvao on 18/07/20.
//  Copyright © 2020 Open Mind House. All rights reserved.
//

import UIKit

class ProfileViewModel: ViewModel {
    
    var viewControllerDelegate: ProfileViewControllerProtocol
    
    init(viewControllerDelegate: ProfileViewControllerProtocol) {
        self.viewControllerDelegate = viewControllerDelegate
    }

}

protocol ProfileViewModelProtocol: ViewModelProtocol {
    
}

extension ProfileViewModel: ProfileViewModelProtocol {
    
}

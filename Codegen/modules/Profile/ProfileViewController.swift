//
//  ProfileViewController.swift
//  Codegen
//
//  Created by Mário Galvao on 18/07/20.
//  Copyright © 2020 Open Mind House. All rights reserved.
//

import UIKit

class ProfileViewController: ViewController {
    
    
    var viewModelDelegate: ProfileViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

protocol ProfileViewControllerProtocol: ViewControllerProtocol {
    
}

extension ProfileViewController: ProfileViewControllerProtocol {
    
}

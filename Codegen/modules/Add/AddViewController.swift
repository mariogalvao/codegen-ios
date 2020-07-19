//
//  AddViewController.swift
//  Codegen
//
//  Created by Mário Galvao on 18/07/20.
//  Copyright © 2020 Open Mind House. All rights reserved.
//

import UIKit

class AddViewController: ViewController {
    
    
    var viewModelDelegate: AddViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

protocol AddViewControllerProtocol: ViewControllerProtocol {
    
}

extension AddViewController: AddViewControllerProtocol {
    
}

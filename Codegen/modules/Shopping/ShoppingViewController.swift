//
//  ShoppingViewController.swift
//  Codegen
//
//  Created by Mário Galvao on 18/07/20.
//  Copyright © 2020 Open Mind House. All rights reserved.
//

import UIKit

class ShoppingViewController: ViewController {
    
    
    var viewModelDelegate: ShoppingViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

protocol ShoppingViewControllerProtocol: ViewControllerProtocol {
    
}

extension ShoppingViewController: ShoppingViewControllerProtocol {
    
}

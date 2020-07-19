//
//  SearchViewController.swift
//  Codegen
//
//  Created by Mário Galvao on 18/07/20.
//  Copyright © 2020 Open Mind House. All rights reserved.
//

import UIKit

class SearchViewController: ViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModelDelegate: SearchViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Search Pets"
        
        searchBar.delegate = self
        
        tableView.register(UINib(nibName: "PetTableViewCell", bundle: nil), forCellReuseIdentifier: "PetTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.keyboardDismissMode = .onDrag
        
        viewModelDelegate?.loadPets()
    }

}

protocol SearchViewControllerProtocol: ViewControllerProtocol {
    
    func reloadPets()
    
}

extension SearchViewController: SearchViewControllerProtocol {
    
    func reloadPets() {
        tableView.reloadData()
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModelDelegate?.updateSearchText(text: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelDelegate?.getNumberOfPets() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PetTableViewCell", for: indexPath) as? PetTableViewCell else {
            return UITableViewCell()
        }
        if let viewModelDelegate = self.viewModelDelegate {
            cell.setPet(viewModelDelegate.getPet(for: indexPath.row))
        }
        return cell
    }
    
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModelDelegate?.selectPet(index: indexPath.row)
    }
    
}

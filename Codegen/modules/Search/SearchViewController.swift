//
//  SearchViewController.swift
//  Codegen
//
//  Created by Mário Galvao on 18/07/20.
//  Copyright © 2020 Open Mind House. All rights reserved.
//

import UIKit

class SearchViewController: ViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
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
        
        viewModelDelegate?.loadPets(by: .available)
    }
    
    // MARK: Actions
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            viewModelDelegate?.loadPets(by: .available)
        case 1:
            viewModelDelegate?.loadPets(by: .pending)
        case 2:
            viewModelDelegate?.loadPets(by: .sold)
        default:
            break
        }
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

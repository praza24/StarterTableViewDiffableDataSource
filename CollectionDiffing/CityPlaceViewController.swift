//
//  ViewController.swift
//  CollectionDiffing
//
//  Created by Alfian Losari on 11/01/20.
//  Copyright © 2020 Alfian Losari. All rights reserved.
//

import UIKit

class CityPlaceViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItems()
    }
    
    private func setupNavigationItems() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Shuffle", style: .done, target: self, action: #selector(shuffleTapped(_:)))
    }
    
    @objc func shuffleTapped(_ sender: Any) {
        
    }
    
}

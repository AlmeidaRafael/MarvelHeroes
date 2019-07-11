//
//  ViewController.swift
//  MarvelHeroes
//
//  Created by RafaelAlmeida on 10/07/19.
//  Copyright © 2019 RafaelAlmeida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    fileprivate func fetchData() {
        ApiService.shared.fetchAllHeroes { (heroes, err) in
            if let err = err {
                print("Failed to fetch heroes:", err)
                return
            }
        }
    }
}


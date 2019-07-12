//
//  ViewController.swift
//  MarvelHeroes
//
//  Created by RafaelAlmeida on 10/07/19.
//  Copyright © 2019 RafaelAlmeida. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var heroesArray = [Hero]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "HeroTableViewCell", bundle: nil), forCellReuseIdentifier: "HeroTableViewCell")
        fetchData()
    }
    
    fileprivate func fetchData() {
        ApiService.shared.fetchAllHeroes { (response, err) in
            if let err = err {
                print("Failed to fetch heroes:", err)
                return
            } else {
                if let heroes = response?.data.results {
                    self.heroesArray = heroes
                    self.tableView.reloadData()
                }
            }
        }
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroTableViewCell") as! HeroTableViewCell
       
        cell.setupCell(name: heroesArray[indexPath.row].name, description: heroesArray[indexPath.row].description)
//        cell?.lbName?.text = "CU"
//        cell.lbDescription?.text = "Cu"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension HomeViewController {
    func downloadImage(url: String) {
//        let task = URLSession.shared.downloadTask(with: url) { localURL, urlResponse, error in
//            if let localURL = localURL {
//                if let string = try? String(contentsOf: localURL) {
//                    print(string)
//                }
//            }
//        }
//        
//        task.resume()
    }
}

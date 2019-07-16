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
    var imageTasks = [Int: ImageTask]()
    
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
                    self.setupImageTasks(totalImages: self.heroesArray.count)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    private func setupImageTasks(totalImages: Int) {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        for i in 0..<totalImages {
            let hero = heroesArray[i]
            let url = hero.thumbnail.path + APIUtils.imageLandscapeAmazing + hero.thumbnail.imgExtension
            let finalUrl = URL(string: url)!
            let imageTask = ImageTask(position: i, url: finalUrl, session: session, delegate: self)
            imageTasks[i] = imageTask
        }
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroTableViewCell") as! HeroTableViewCell
        cell.setupCell(hero: heroesArray[indexPath.row], image: imageTasks[indexPath.row]?.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        imageTasks[indexPath.row]?.resume()
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        imageTasks[indexPath.row]?.pause()
    }
}

extension HomeViewController: ImageTaskDownloadedDelegate {
    func imageDownloaded(position: Int) {
        self.tableView.reloadRows(at: [IndexPath(row: position, section: 0)], with: .automatic)
        
//        if let selectedImage = self.selectedImage, selectedImage.row == position, let image = imageTasks[position]?.image {
//            selectedImage.imageView.set(image: image)
//        }
    }
}

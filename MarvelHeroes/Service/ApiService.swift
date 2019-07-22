//
//  ApiService.swift
//  MarvelHeroes
//
//  Created by RafaelAlmeida on 10/07/19.
//  Copyright © 2019 RafaelAlmeida. All rights reserved.
//

import Foundation

class ApiService: NSObject {
    static let shared = ApiService()
    
    func fetchAllHeroes(offSet: Int?, completion: @escaping (ApiResponse?, Error?) -> ()) {
        guard let url = APIUtils().getUrl(offSet: offSet) else { return }
        print(url)
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch heroes: ", err)
                return
            }
            
            guard let data = data else { return }
            do {
                let heroes = try JSONDecoder().decode(ApiResponse.self, from: data)
                DispatchQueue.main.async {
                    print(heroes)
                    completion(heroes, nil)
                }
            } catch let jsonErr {
                print("Failed to decode: ", jsonErr)
            }
        }.resume()
    }
    
    func downloadImage(url: String, completion: @escaping (Data?, Error?) -> ()) {
        guard let imageUrl = URL(string: url) else { return }
        let downloadTask = URLSession.shared.downloadTask(with: imageUrl) { localURL, resp, err in
            if let err = err {
                completion(nil, err)
                print("Failed to get image: ", err)
                return
            }
            
            if let localURL = localURL {
                if let image = try? Data(contentsOf: localURL) {
                    completion(image, nil)
                }
            }
        }
        downloadTask.resume()
    }
}


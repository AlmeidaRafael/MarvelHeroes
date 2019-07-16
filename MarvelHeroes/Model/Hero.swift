//
//  Hero.swift
//  MarvelHeroes
//
//  Created by RafaelAlmeida on 10/07/19.
//  Copyright © 2019 RafaelAlmeida. All rights reserved.
//

import Foundation

struct Hero: Decodable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Image
}

struct Image: Decodable {
    let path: String
    let imgExtension: String
    
    enum CodingKeys: String, CodingKey {
        case imgExtension = "extension", path
    }
}

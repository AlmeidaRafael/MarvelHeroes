//
//  ApiResponse.swift
//  MarvelHeroes
//
//  Created by RafaelAlmeida on 11/07/19.
//  Copyright © 2019 RafaelAlmeida. All rights reserved.
//

import Foundation

struct ApiResponse: Decodable {
    let code: Int
    let status: String
    let data: ApiData
}

struct ApiData: Decodable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: Array<Hero>
}

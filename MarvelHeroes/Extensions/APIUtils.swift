//
//  APIUtils.swift
//  MarvelHeroes
//
//  Created by RafaelAlmeida on 11/07/19.
//  Copyright © 2019 RafaelAlmeida. All rights reserved.
//

import Foundation

struct APIUtils {
    static let shared = APIUtils()
    static let imageProfileLarge = "/standard_large."
    static let imageLandscapeAmazing = "/landscape_amazing."
    
    let baseUrl = "https://gateway.marvel.com/"
    let apiKey = Bundle.main.object(forInfoDictionaryKey: "Marvel Api Key") as? String ?? ""
    let privateKey = Bundle.main.object(forInfoDictionaryKey: "Marvel Api Private Key") as? String ?? ""
    let ts = String(Date.timeIntervalBetween1970AndReferenceDate)
    
    func getUrl(offSet: Int?) -> URL?{
        let hash = (ts + privateKey + apiKey).md5Value
        let offSetKey = "&offset=\(offSet ?? 0)"
        let urlString = baseUrl + "v1/public/characters" + "?apikey=" + apiKey + "&hash=" + hash + "&ts=" + ts + offSetKey
       return URL(string: urlString) ?? nil
    }
}

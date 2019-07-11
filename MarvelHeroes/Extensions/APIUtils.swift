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
    let baseUrl = "https://gateway.marvel.com/"
    let apiKey = Bundle.main.object(forInfoDictionaryKey: "Marvel Api Key") as? String ?? ""
    let privateKey = Bundle.main.object(forInfoDictionaryKey: "Marvel Api Private Key") as? String ?? ""
    let ts = String(Date.timeIntervalBetween1970AndReferenceDate)
    
    func getUrl() -> URL?{
        let hash = (ts + privateKey + apiKey).md5Value
        let urlString = baseUrl + "v1/public/characters" + "?apikey=" + apiKey + "&hash=" + hash + "&ts=" + ts
       return URL(string: urlString) ?? nil
    }
}


//var params = [String:Any]()
//let ts = String(Date.timeIntervalBetween1970AndReferenceDate)
//params["ts"] = ts
//params["apikey"] = publicKey
//params["hash"] = (ts + privateKey + publicKey).md5Value
//let jsonData = try! JSONSerialization.data(withJSONObject: params, options: [])

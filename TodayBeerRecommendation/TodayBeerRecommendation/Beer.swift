//
//  Beer.swift
//  TodayBeer
//
//  Created by 성민주민주 on 2021/12/21.
//

import UIKit

struct Beer: Decodable {
    let id: Int?
    let name, tagline, description, imageURL: String?
    let foodPairing: [String]?
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case foodPairing = "food_pairing"
        case id, name, tagline, description
    }
    
}


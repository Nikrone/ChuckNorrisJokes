//
//  Category.swift
//  ChuckNorrisJokes
//
//  Created by Evgeniy Nosko on 5.10.21.
//

import Foundation

struct Joke: Codable {
    let iconURL: String
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case iconURL = "icon_url"
        case value
    }
}

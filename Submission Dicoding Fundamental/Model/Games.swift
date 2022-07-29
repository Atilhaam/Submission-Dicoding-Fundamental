//
//  Games.swift
//  Submission Dicoding Fundamental
//
//  Created by Ilham Wibowo on 11/06/22.
//

import Foundation
import UIKit

struct GamesSearch: Codable {
    let count: Int
    let games: [GameInSearch]
    
    enum CodingKeys: String, CodingKey {
        case count
        case games = "results"
    }
    
    
}

struct Games: Codable {
    let count: Int
    let games: [Game]
    
    enum CodingKeys: String, CodingKey {
        case count
        case games = "results"
    }
    
}

struct Game: Codable {
    let id: Int
    let name: String
    let backgroundImage: String?
    let rating: Double?
    let metacritic: Int?
    let released: Date?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case backgroundImage = "background_image"
        case rating
        case metacritic
        case released
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dateString = try container.decode(String.self, forKey: .released)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateString)!
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        backgroundImage = try container.decode(String.self, forKey: .backgroundImage)
        rating = try container.decode(Double.self, forKey: .rating)
        metacritic = try container.decode(Int.self, forKey: .metacritic)
        released = date
    }
}

struct GameInSearch: Codable {
    let name: String
    let id: Int
    let backgroundImage: String?
    let metacritic: Int?
//    let released: Date?

    
    enum CodingKeys: String, CodingKey {
        case name
        case id
        case backgroundImage = "background_image"
        case metacritic
//        case released

    }

    
}

struct GameDetail: Codable {
    let description: String
    let metacritic: Int
    let released: String
    let background_image: String
    let genres: [Genre]
    let platforms: [Platforms]
    let developers: [Developer]
    let publishers: [Publisher]
}

struct Platforms: Codable {
    let platform: Platform
}

struct Platform: Codable {
    let name: String
    
}

struct Genre: Codable {
    let name: String
}

struct Developer: Codable {
    let name: String
}

struct Publisher: Codable {
    let name: String
}


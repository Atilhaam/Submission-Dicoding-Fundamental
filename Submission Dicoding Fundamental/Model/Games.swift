//
//  Games.swift
//  Submission Dicoding Fundamental
//
//  Created by Ilham Wibowo on 11/06/22.
//

import Foundation
import UIKit

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
    let backgroundImage: String
    let rating: Double
    let metacritic: Int
    let released: String
    
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
//        let dateString = try container.decode(String.self, forKey: .released)
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        let date = dateFormatter.date(from: dateString)!
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        backgroundImage = try container.decode(String.self, forKey: .backgroundImage)
        rating = try container.decode(Double.self, forKey: .rating)
        metacritic = try container.decode(Int.self, forKey: .metacritic)
        released = try container.decode(String.self, forKey: .released)
//        genres = try container.decode(Array.self, forKey: .genres)
    }
}
struct GameDetail: Codable {
    let description: String
    let genres: [Genre]
    let platforms: [Platforms]
    let developers: [Developer]
    let publishers: [Publisher]
    
    enum CodingKeys: String, CodingKey {
        case description
        case genres
        case platforms
        case developers
        case publishers
        
    }
    
}

struct Platforms: Codable {
    let platform: Platform
    
    enum CodingKeys: String, CodingKey {
        case platform
    }
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

/*
struct GameDetail: Codable {
    let description: String
    let genres: [Genre]
    let platforms: [Platform]
    let developers: [Developer]
    let publishers: [Publisher]
    
    enum CodingKeys: String, CodingKey {
        case description
        case genres
        case platforms
        case developers
        case publishers
    }
    
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
*/


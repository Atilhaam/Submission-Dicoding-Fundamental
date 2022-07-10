//
//  Creator.swift
//  Submission Dicoding Fundamental
//
//  Created by Ilham Wibowo on 08/07/22.
//

import Foundation
import UIKit

struct Creators: Codable {
    let count: Int
    let creators: [Creator]
    
    enum CodingKeys: String, CodingKey {
        case count
        case creators = "results"
    }
}

struct Creator: Codable {
    let id: Int
    let name: String
    let image: String
    let games: [GameCreator]
}

struct CreatorDetail: Codable {
    let positions: [Position]
    let description: String
}

struct Position: Codable {
    let name: String
}

struct GameCreator: Codable {
    let id: Int
    let name: String
    
}

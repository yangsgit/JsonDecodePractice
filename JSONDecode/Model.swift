//
//  SuperHero.swift
//  JSONDecode
//
//  Created by Yang Li on 12/2/20.
//

import Foundation

struct SuperHeroClub: Codable {
    
    enum CodingKeys: String, CodingKey {
        case squadName, homeTown, formed, base = "secretBase", members
    }
    
    enum HeroKeys: String, CodingKey {
        case name, secretIdentity
    }
    let squadName: String
    let homeTown: String
    let formed: Int
    let base: String
//    let active: Bool
    let members: [SuperHero]

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        squadName = try container.decode(String.self, forKey: .squadName)
        homeTown = try container.decode(String.self, forKey: .homeTown)
        formed = try container.decode(Int.self, forKey: .formed)
        base = try container.decode(String.self, forKey: .base)
        members = try container.decode([SuperHero].self, forKey: .members)
    }
}

struct SuperHero: Codable {
    let name: String
//    let age: Int
    let secretIdentity: String
//    let powers: [String]
}

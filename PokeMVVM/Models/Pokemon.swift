//
//  Pokemon.swift
//  PokeMVVM
//
//  Created by Shayan on 11/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import Foundation

struct Creature: Codable {
    let name: String
    let url: String
}

struct Pokemon: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Creature]?
}

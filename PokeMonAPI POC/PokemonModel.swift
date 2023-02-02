//
//  PokemonModel.swift
//  PokeMonAPI POC
//
//  Created by Guru Mahan on 27/01/23.
//

import Foundation

struct PokemonModel: Codable {
    let count: Int
    let next: String
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let name: String
    let url: String
    
}

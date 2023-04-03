//
//  PokemonInnerDataModel.swift
//  PokeMonAPI POC
//
//  Created by Guru Mahan on 30/01/23.
//

import Foundation

struct PokemonInnerDataModel: Codable{
    let baseExperience: Int
    let height: Int
    let id: Int
    let name: String?
    let species: Species
    let sprites: Sprites
    let weight: Int
    
    enum CodingKeys: String, CodingKey {
          case baseExperience = "base_experience"
          case height
          case id
          case name
          case species
          case sprites
          case weight
        
      }
}



// MARK: - Species
struct Species: Codable {
    let name: String
    let url: String
}



// MARK: - Sprites
struct Sprites: Codable {
    let backDefault: String
    let backShiny: String
    let frontDefault: String
    let frontShiny: String

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    
    }
}

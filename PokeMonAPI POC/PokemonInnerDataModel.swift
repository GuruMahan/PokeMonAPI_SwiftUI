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
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.baseExperience = try container.decode(Int.self, forKey: .baseExperience)
//        self.height = try container.decode(Int.self, forKey: .height)
//        self.id = try container.decode(Int.self, forKey: .id)
//        self.isDefault = try container.decode(Bool.self, forKey: .isDefault)
//        self.locationAreaEncounters = try container.decode(String.self, forKey: .locationAreaEncounters)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.order = try container.decode(Int.self, forKey: .order)
//        self.weight = try container.decode(Int.self, forKey: .weight)
//        self.species = try container.decode([Species].self, forKey: .species)
//        self.sprites = try container.decode(Sprites.self, forKey: .sprites)
//
//    }
  
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

//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.backDefault = try container.decode(String.self, forKey: .backDefault)
//        self.backShiny = try container.decode(String.self, forKey: .backShiny)
//        self.frontDefault = try container.decode(String.self, forKey: .frontDefault)
//        self.frontShiny = try container.decode(String.self, forKey: .frontShiny)
//    }
}

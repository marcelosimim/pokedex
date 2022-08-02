//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/1/22.
//

import Foundation

struct PokemonModel: Decodable {
    var abilities: [ResultAbilityModel]?
    var height: Int?
    var id: Int?
    var name: String?
    var types: [ResultTypeModel]?
    var image: Data? 
}

struct SpriteModel: Decodable {
    var front_default: String?
}

struct ResultTypeModel: Decodable {
    var type: TypeModel?
}

struct TypeModel: Decodable {
    var name: String?
}

struct ResultAbilityModel: Decodable {
    var ability: AbilityModel?
}

struct AbilityModel: Decodable {
    var name: String?
}

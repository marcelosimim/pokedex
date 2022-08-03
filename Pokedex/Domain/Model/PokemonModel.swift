//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/1/22.
//

import Foundation

struct PokemonModel {
    var abilities: [ResultAbilityModel]?
    var height: Int?
    var weight: Int?
    var id: Int?
    var name: String?
    var types: [ResultTypeModel]?
    var image: Data?
    var moves: [ResultMoveModel]?
    var stats: [StatModel]?
}

struct ResultTypeModel {
    var type: TypeModel?
}

struct TypeModel {
    var name: String?
}

struct ResultAbilityModel {
    var ability: AbilityModel?
}

struct AbilityModel {
    var name: String?
}

struct ResultMoveModel {
    var move: MoveModel?
}

struct MoveModel {
    var name: String?
}

struct StatModel {
    var baseStat: Int?
}

//
//  PokemonEntity.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/2/22.
//

import Foundation

struct PokemonEntity: Decodable {
    var abilities: [ResultAbilityEntity]?
    var height: Int?
    var weight: Int?
    var id: Int?
    var name: String?
    var sprites: SpriteEntity?
    var types: [ResultTypeEntity]?
    var image: Data?
    var moves: [ResultMoveEntity]?
    var stats: [StatEntity]?

    func toModel() -> PokemonModel {
        PokemonModelBuilder()
            .withAbilities(abilities: abilities)
            .withHeight(height: height)
            .withWeight(weight: weight)
            .withId(id: id)
            .withName(name: name)
            .withTypes(types: types)
            .withImage(image: image)
            .withMoves(moves: moves)
            .withStats(stats: stats)
            .build()
    }
}

struct SpriteEntity: Decodable {
    let front_default: String?
}

struct ResultTypeEntity: Decodable {
    let type: TypeEntity
}

struct TypeEntity: Decodable {
    let name: String

    func toModel() -> TypeModel {
        TypeModelBuilder()
            .withName(name: name)
            .build()
    }
}

struct ResultAbilityEntity: Decodable {
    let ability: AbilityEntity
}

struct AbilityEntity: Decodable {
    let name: String

    func toModel() -> AbilityModel {
        AbilityModelBuilder()
            .withName(name: name)
            .build()
    }
}

struct ResultMoveEntity: Decodable {
    let move: MoveEntity
}

struct MoveEntity: Decodable {
    let name: String

    func toModel() -> MoveModel {
        MoveModelBuilder()
            .withName(name: name)
            .build()
    }
}

struct StatEntity: Decodable {
    let baseStat: Int

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
    }

    func toModel() -> StatModel {
        StatModelBuilder()
            .withBaseStat(baseStat: baseStat)
            .build()
    }

}

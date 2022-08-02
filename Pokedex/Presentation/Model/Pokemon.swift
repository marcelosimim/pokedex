//
//  Pokemon.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/2/22.
//

import Foundation

struct Pokemon: Decodable {
    var abilities: [ResultAbility]?
    var height: Int?
    var id: Int?
    var name: String?
    var types: [ResultType]?
    var image: Data?

    static func fromModel(model: PokemonModel) -> Pokemon {
        return Pokemon(abilities: Pokemon.transformAbilities(resultAbilityModel: model.abilities), height: model.height, id: model.id, name: model.name, types: Pokemon.transformType(resultTypeModel: model.types), image: model.image)
    }

    private static func transformType(resultTypeModel: [ResultTypeModel]?) -> [ResultType]? {
        guard let resultTypeModel = resultTypeModel else { return nil }
        let typeCount = resultTypeModel.count
        if typeCount == 0 { return nil }
        var types = Array(repeating: ResultType(), count: typeCount)
        for index in 0...(typeCount-1) {
            types[index] = ResultType.fromModel(model: resultTypeModel[index])
        }
        return types
    }

    private static func transformAbilities(resultAbilityModel: [ResultAbilityModel]?) -> [ResultAbility]? {
        guard let resultAbilityModel = resultAbilityModel else { return nil }
        let count = resultAbilityModel.count
        if count == 0 { return nil }
        var abilities = Array(repeating: ResultAbility(), count: count)
        for index in 0...(count-1) {
            abilities[index] = ResultAbility.fromModel(model: resultAbilityModel[index])
        }
        return abilities
    }
}

struct Sprite: Decodable {
    var front_default: String?
}

struct ResultType: Decodable {
    var type: TypePokemon?

    static func fromModel(model: ResultTypeModel) -> ResultType {
        ResultType(type: TypePokemon.fromModel(model: model.type))
    }
}

struct TypePokemon: Decodable {
    var name: String?

    static func fromModel(model: TypeModel?) -> TypePokemon {
        TypePokemon(name: model?.name)
    }
}

struct ResultAbility: Decodable {
    var ability: Ability?

    static func fromModel(model: ResultAbilityModel) -> ResultAbility {
        ResultAbility(ability: Ability.fromModel(model: model.ability))
    }
}

struct Ability: Decodable {
    var name: String?

    static func fromModel(model: AbilityModel?) -> Ability {
        Ability(name: model?.name)
    }
}

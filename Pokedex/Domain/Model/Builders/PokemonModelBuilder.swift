//
//  PokemonModelBuilder.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/2/22.
//

import Foundation

final class PokemonModelBuilder {
    private var pokemonModel = PokemonModel()
    public init() {}

    func withAbilities(abilities: [ResultAbilityEntity]?) -> PokemonModelBuilder {
        var resultAbilityModel = Array(repeating: ResultAbilityModel(), count: abilities?.count ?? 0)
        if resultAbilityModel.count == 0 { return self }
        for index in 0...(resultAbilityModel.count-1) {
            resultAbilityModel[index].ability = abilities?[index].ability.toModel()
        }
        pokemonModel.abilities = resultAbilityModel
        return self
    }

    func withHeight(height: Int?) -> PokemonModelBuilder {
       pokemonModel.height = height
       return self
    }

    func withWeight(weight: Int?) -> PokemonModelBuilder {
       pokemonModel.weight = weight
       return self
    }

    func withId(id: Int?) -> PokemonModelBuilder {
       pokemonModel.id = id
       return self
    }

    func withName(name: String?) -> PokemonModelBuilder {
       pokemonModel.name = name
       return self
    }

    func withTypes(types: [ResultTypeEntity]?) -> PokemonModelBuilder {
        var resultTypeModel = Array(repeating: ResultTypeModel(), count: types?.count ?? 0)
        if resultTypeModel.count == 0 { return self }
        for index in 0...(resultTypeModel.count-1) {
            resultTypeModel[index].type = types?[index].type.toModel()
        }
        pokemonModel.types = resultTypeModel
        return self
    }

    func withMoves(moves: [ResultMoveEntity]?) -> PokemonModelBuilder {
        var resultMoveModel = Array(repeating: ResultMoveModel(), count: moves?.count ?? 0)
        if resultMoveModel.count == 0 { return self }
        for index in 0...(resultMoveModel.count-1) {
            resultMoveModel[index].move = moves?[index].move.toModel()
        }
        pokemonModel.moves = resultMoveModel
        return self
    }

    func withImage(image: Data?) -> PokemonModelBuilder {
       pokemonModel.image = image
       return self
    }

    func withStats(stats: [StatEntity]?) -> PokemonModelBuilder {
        var statModel = Array(repeating: StatModel(), count: stats?.count ?? 0)
        if statModel.count == 0 { return self }
        for index in 0...(statModel.count-1) {
            statModel[index] = stats?[index].toModel() ?? statModel[index]
        }
        pokemonModel.stats = statModel
        return self
    }

    func build() -> PokemonModel {
        pokemonModel
    }
}

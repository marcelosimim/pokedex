//
//  DefaultPokemonUseCase.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/2/22.
//

import Foundation

final class DefaultPokemonUseCase: PokemonUseCase {
    private let pokeAPIRepository: PokeAPIRepository

    init(pokeAPIRepository: PokeAPIRepository) {
        self.pokeAPIRepository = pokeAPIRepository
    }

    func getAll(completion: @escaping ([PokemonModel]?) -> ()) {
        pokeAPIRepository.getAll(completion: completion)
    }
}

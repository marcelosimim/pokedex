//
//  DefaultDescriptionUseCase.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/3/22.
//

import Foundation

final class DefaultDescriptionUseCase: DescriptionUseCase {
    private let pokeAPIRepository: PokeAPIRepository

    init(pokeAPIRepository: PokeAPIRepository) {
        self.pokeAPIRepository = pokeAPIRepository
    }

    func getDescription(id: Int, completion: @escaping (DescriptionModel?) -> ()) {
        pokeAPIRepository.getDescription(id: id, completion: completion)
    }
}

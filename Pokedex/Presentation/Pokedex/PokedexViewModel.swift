//
//  PokedexViewModel.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/2/22.
//

import Foundation

protocol PokedexViewModel {
    var pokemons:Observable<[Pokemon]> { get }

    func getAll()
}

class DefaultPokedexViewModel: PokedexViewModel {
    private let pokedexUseCase: PokedexUseCase
    var pokemons: Observable<[Pokemon]> = Observable([])

    init(pokedexUseCase: PokedexUseCase) {
        self.pokedexUseCase = pokedexUseCase
    }

    func getAll() {
        pokedexUseCase.getAll { result in
            guard let result = result else { return }
            let resultSize = result.count
            var pokemons = Array(repeating: Pokemon(), count: resultSize)
            for index in 0...(resultSize-1) {
                pokemons[index] = Pokemon.fromModel(model: result[index])
            }
            self.pokemons.value = pokemons
        }
    }
}

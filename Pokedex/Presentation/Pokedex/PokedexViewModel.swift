//
//  PokedexViewModel.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/2/22.
//

import Foundation

protocol PokedexViewModel {
    var pokemons:Observable<[Pokemon]> { get }
    var isAscending: Bool { get set }

    func getAll()
    func sortByNumber()
    func sortByLetter()
}

class DefaultPokedexViewModel: PokedexViewModel {
    private let pokedexUseCase: PokedexUseCase
    var pokemons: Observable<[Pokemon]> = Observable([])
    var isAscending = false

    init(pokedexUseCase: PokedexUseCase) {
        self.pokedexUseCase = pokedexUseCase
    }

    func getAll() {
        if pokemons.value.isEmpty {
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

    func sortByNumber() {
        pokemons.value = pokemons.value.sorted { a, b in
            return a.id ?? 0 < b.id ?? 0
        }
        isAscending.toggle()
    }

    func sortByLetter() {
        pokemons.value = pokemons.value.sorted { a, b in
            return a.name ?? "" < b.name ?? ""
        }
        isAscending.toggle()
    }
}

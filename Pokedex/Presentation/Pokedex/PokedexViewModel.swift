//
//  PokedexViewModel.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/2/22.
//

import Foundation

protocol PokedexViewModel {
    var pokemons: Observable<[Pokemon]> { get }
    var searchResult: Observable<[Pokemon]> { get }
    var isAscending: Bool { get set }
    var isSearching: Observable<Bool> { get }

    func getAll()
    func sortByNumber()
    func sortByLetter()
    func search(_ text: String)
}

class DefaultPokedexViewModel: PokedexViewModel {
    private let pokedexUseCase: PokedexUseCase
    var pokemons: Observable<[Pokemon]> = Observable([])
    var searchResult: Observable<[Pokemon]> = Observable([])
    var isAscending = false
    var isSearching = Observable<Bool>(false)

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

    func search(_ text: String) {
        if text.isEmpty {
            isSearching.value = false
        } else {
            isSearching.value = true
            filterPokemons(text)
        }
    }

    private func filterPokemons(_ text: String) {
        searchResult.value = pokemons.value.filter { pokemon in
            guard let name = pokemon.name else { return false }
            return name.starts(with: text)
        }
    }
}

//
//  DI.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/2/22.
//

import Foundation
import Swinject

class AppContainer {
    static let shared: Container = {
        let container = Container()
        container.register(PokeAPIRepository.self) { _ in DefaultPokeAPIRepository()}
        container.register(PokedexUseCase.self) { r in DefaultPokedexUseCase(pokeAPIRepository: r.resolve(PokeAPIRepository.self)!)}
        container.register(PokedexViewModel.self) { r in DefaultPokedexViewModel(pokedexUseCase: r.resolve(PokedexUseCase.self)!)}
        container.register(DescriptionUseCase.self) { r in DefaultDescriptionUseCase(pokeAPIRepository: r.resolve(PokeAPIRepository.self)!)}
        container.register(PokemonDetailsViewModel.self) { r in DefaultPokemonDetailsViewModel(descriptionUseCase: r.resolve(DescriptionUseCase.self)!)}
        return container
    }()
}

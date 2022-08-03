//
//  PokemonDetailsViewModel.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/3/22.
//

import Foundation
import UIKit

protocol PokemonDetailsViewModel {
    var mainColor: Observable<UIColor?> { get }
    var name: Observable<String?> { get }
    var id: Observable<Int?> { get }
    var image: Observable<Data?> { get }
    var description: Observable<Description?> { get }
    var type: Observable<String?> { get }
    var height: Observable<Int?> { get }
    var weight: Observable<Int?> { get }
    var moves: Observable<[ResultMove]?> { get }
    var stats: Observable<[Stat]?> { get }

    func setPokemon(pokemon: Pokemon)
}

class DefaultPokemonDetailsViewModel: PokemonDetailsViewModel {
    var pokemon = Pokemon()
    var mainColor = Observable<UIColor?>(nil)
    var name = Observable<String?>(nil)
    var id = Observable<Int?>(nil)
    var image = Observable<Data?>(nil)
    var description = Observable<Description?>(nil)
    var type = Observable<String?>(nil)
    var height = Observable<Int?>(nil)
    var weight = Observable<Int?>(nil)
    var moves = Observable<[ResultMove]?>(nil)
    var stats = Observable<[Stat]?>(nil)

    private let descriptionUseCase: DescriptionUseCase
    init(descriptionUseCase: DescriptionUseCase) {
        self.descriptionUseCase = descriptionUseCase
    }

    func setPokemon(pokemon: Pokemon) {
        self.pokemon = pokemon
        guard let id = pokemon.id else { return }
        getDescription(id: id)
        setPokemonInfos()
    }

    private func getDescription(id: Int) {
        descriptionUseCase.getDescription(id: id) { descriptionModel in
            guard let descriptionModel = descriptionModel else { return }
            self.description.value = Description.fromModel(model: descriptionModel)
        }
    }

    private func setPokemonInfos() {
        setMainColor()
        setName()
        setId()
        setImage()
        setType()
        setupHeight()
        setupWeight()
        setupMoves()
        setupStats()
    }

    private func setMainColor() {
        guard let types = pokemon.types, let type = types[0].type, let name = type.name else { return }
        mainColor.value = UIColor(named: name) ?? .black
    }

    private func setName() {
        guard let pokemonName = pokemon.name else { return }
        name.value = pokemonName
    }

    private func setId() {
        guard let pokemonId = pokemon.id else { return }
        id.value = pokemonId
    }

    private func setImage() {
        guard let pokemonImage = pokemon.image else { return }
        image.value = pokemonImage
    }

    private func setType() {
        guard let pokemonTypes = pokemon.types, let pokemonType = pokemonTypes[0].type?.name else { return }
        type.value = pokemonType
    }

    private func setupHeight() {
        guard let pokemonHeight = pokemon.height else { return }
        height.value = pokemonHeight
    }

    private func setupWeight() {
        guard let pokemonWeight = pokemon.weight else { return }
        weight.value = pokemonWeight
    }

    private func setupMoves() {
        guard let pokemonMoves = pokemon.moves else { return }
        moves.value = pokemonMoves
    }

    private func setupStats() {
        guard let pokemonStats = pokemon.stats else { return }
        stats.value = pokemonStats
    }
}

//
//  PokeAPIRepository.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/1/22.
//

import Foundation

protocol PokeAPIRepository {
    func getAll(completion: @escaping([PokemonModel]?) -> ())
}

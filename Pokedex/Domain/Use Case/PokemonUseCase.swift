//
//  PokemonUseCase.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/2/22.
//

import Foundation

protocol PokemonUseCase {
    func getAll(completion: @escaping([PokemonModel]?) -> ())
}

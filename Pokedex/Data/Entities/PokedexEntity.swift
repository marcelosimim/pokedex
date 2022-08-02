//
//  PokedexEntity.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/2/22.
//

import Foundation

struct PokedexEntity: Decodable {
    let results: [ResultsEntity]
}

struct ResultsEntity: Decodable {
    let name: String
    let url: String
}

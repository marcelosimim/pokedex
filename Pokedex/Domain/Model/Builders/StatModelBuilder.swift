//
//  StatModelBuilder.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/3/22.
//

import Foundation

class StatModelBuilder {
    private var statModel = StatModel()
    public init() {}

    func withBaseStat(baseStat: Int?) -> StatModelBuilder {
        statModel.baseStat = baseStat
        return self
    }

    func build() -> StatModel {
        statModel
    }
}

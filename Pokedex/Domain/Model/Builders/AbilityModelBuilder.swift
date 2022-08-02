//
//  AbilityModelBuilder.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/2/22.
//

import Foundation

final class AbilityModelBuilder {
    private var abilityModel = AbilityModel()
    public init() {}

    func withName(name: String?) -> AbilityModelBuilder {
        abilityModel.name = name
        return self
    }

    func build() -> AbilityModel {
        abilityModel
    }
}

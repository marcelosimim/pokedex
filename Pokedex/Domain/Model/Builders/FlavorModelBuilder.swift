//
//  FlavorModelBuilder.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/3/22.
//

import Foundation

class FlavorModelBuilder {
    private var flavorModel = FlavorModel()
    public init() {}

    func withFlavor(flavor_text: String?) -> FlavorModelBuilder {
        flavorModel.flavor_text = flavor_text
        return self
    }

    func build() -> FlavorModel {
        flavorModel
    }
}

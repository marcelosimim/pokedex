//
//  DescriptionModelBuilder.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/3/22.
//

import Foundation

class DescriptionModelBuilder {
    private var descriptionModel = DescriptionModel()
    public init() {}

    func withFlavorTextEntries(flavor_text_entries: [FlavorEntity]) -> DescriptionModelBuilder {
        var flavorTextEntries = Array(repeating: FlavorModel(), count: flavor_text_entries.count)
        if flavorTextEntries.count == 0 { return self }
        for index in 0...(flavor_text_entries.count-1) {
            flavorTextEntries[index] = flavor_text_entries[index].toModel()
        }
        descriptionModel.flavor_text_entries = flavorTextEntries
        return self
    }

    func build() -> DescriptionModel {
        descriptionModel
    }
}

//
//  DescripitonEntity.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/2/22.
//

import Foundation

struct DescripitonEntity: Decodable {
    let flavor_text_entries: [FlavorEntity]

    func toModel() -> DescriptionModel {
        DescriptionModelBuilder()
            .withFlavorTextEntries(flavor_text_entries: flavor_text_entries)
            .build()
    }
}

struct FlavorEntity: Decodable {
    let flavor_text: String

    func toModel() -> FlavorModel {
        FlavorModelBuilder()
            .withFlavor(flavor_text: flavor_text)
            .build()
    }
}



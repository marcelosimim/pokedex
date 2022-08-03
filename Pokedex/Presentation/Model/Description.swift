//
//  Description.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/3/22.
//

import Foundation

struct Description {
    var flavor_text_entries: [Flavor]?

    static func fromModel(model: DescriptionModel) -> Description {
        Description(flavor_text_entries: transformFlavors(flavor_text_entries: model.flavor_text_entries))
    }

    private static func transformFlavors(flavor_text_entries: [FlavorModel]?) -> [Flavor]? {
        guard let flavor_text_entries = flavor_text_entries else { return nil }
        let count = flavor_text_entries.count
        if count == 0 { return nil }
        var flavors = Array(repeating: Flavor(), count: count)
        for index in 0...(count-1) {
            flavors[index] = Flavor.fromModel(model: flavor_text_entries[index])
        }
        return flavors
    }
}

struct Flavor {
    var flavor_text: String?

    static func fromModel(model: FlavorModel) -> Flavor {
        Flavor(flavor_text: model.flavor_text)
    }
}

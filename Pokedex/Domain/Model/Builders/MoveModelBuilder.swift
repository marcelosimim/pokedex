//
//  MoveModelBuilder.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/2/22.
//

import Foundation

final class MoveModelBuilder {
    private var moveModel = MoveModel()
    public init() {}

    func withName(name: String?) -> MoveModelBuilder {
        moveModel.name = name
        return self
    }

    func build() -> MoveModel {
        moveModel
    }
}

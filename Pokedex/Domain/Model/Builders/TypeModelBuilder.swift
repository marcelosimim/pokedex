//
//  TypeModelBuilder.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/2/22.
//

import Foundation

final class TypeModelBuilder {
    private var typeModel = TypeModel()
    public init() {}

    func withName(name: String?) -> TypeModelBuilder {
        typeModel.name = name
        return self
    }

    func build() -> TypeModel {
        typeModel
    }
}

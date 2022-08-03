//
//  DescriptionUseCase.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/3/22.
//

import Foundation

protocol DescriptionUseCase {
    func getDescription(id: Int, completion: @escaping(DescriptionModel?) -> ())
}

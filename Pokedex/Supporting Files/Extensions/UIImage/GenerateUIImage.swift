//
//  GenerateUIImage.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/1/22.
//

import UIKit

extension UIImage {
    public static var pokeball: UIImage {
        imageBuilder("pokeball")
    }
    public static var search: UIImage {
        UIImage(systemName: "magnifyingglass")!
    }
}

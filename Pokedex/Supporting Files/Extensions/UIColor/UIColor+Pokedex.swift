//
//  UIColor+Pokedex.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/1/22.
//

import UIKit

extension UIColor {
    public static func colorBuilder(_ colorName: String) -> UIColor {
        guard let color = UIColor(named: colorName) else {
            return .clear
        }
        return color
    }
}

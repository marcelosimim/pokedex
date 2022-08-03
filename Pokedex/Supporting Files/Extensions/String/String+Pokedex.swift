//
//  String+Pokedex.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/2/22.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }

    static func formatId(id: Int) -> String{
        if id < 10 {
            return "#00\(id)"
        } else if id < 100 {
            return "#0\(id)"
        } else {
            return "#\(id)"
        }
    }

    static func formatStat(stat: Int) -> String{
        if stat < 10 {
            return "00\(stat)"
        } else if stat < 100 {
            return "0\(stat)"
        } else {
            return "\(stat)"
        }
    }
}

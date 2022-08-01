//
//  UIImage+Pokedex.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/1/22.
//

import UIKit

extension UIImage {
    public static func imageBuilder(_ imageName: String) -> UIImage {
       guard let image = UIImage(named: imageName) else {
           return UIImage(systemName: "xmark.octagon.fill")!
       }
       return image
    }
}

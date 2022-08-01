//
//  Dimen.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/1/22.
//

import Foundation
import UIKit

class Dimen {
    public static let deviceHeight = UIScreen.main.bounds.height
    public static let deviceWidth = UIScreen.main.bounds.width
    public static let heightMultiplier: CGFloat = deviceHeight/812
    public static let widthMultiplier: CGFloat = deviceWidth/375
    public static let leadingMargin: CGFloat = 24*widthMultiplier
    public static let textFieldHeight: CGFloat = 34*heightMultiplier
}

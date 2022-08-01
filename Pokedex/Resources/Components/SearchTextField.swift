//
//  SearchTextField.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/1/22.
//

import UIKit

class SearchTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 15)

    func setupSearch() {
        let imageView = UIImageView(image: .search)
        imageView.tintColor = .mediumGray
        imageView.contentMode = .center
        leftView = imageView
        leftViewMode = .always
        backgroundColor = .white
        attributedPlaceholder = NSAttributedString(
            string: "Procurar",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.mediumGray]
        )
    }
}

extension SearchTextField {
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.width - 30, y: 0, width: 20 , height: bounds.height)
    }
}

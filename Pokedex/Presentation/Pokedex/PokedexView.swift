//
//  PokedexView.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/1/22.
//

import UIKit

class PokedexView: UIView {
    private let pokeball = UIImageView()
    private let titleLabel = UILabel()
    let searchTextField = SearchTextField()
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .clear
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: PokemonCollectionViewCell.identifier)
        return collectionView
    }()
    let sortButton = UIButton()

    override func layoutSubviews() {
        setupStyles()
        addViews()
    }

    private func addViews() {
        addSubviews([pokeball, titleLabel, sortButton, searchTextField, collectionView])
        setupConstraints()
    }

    private func setupConstraints() {
        pokeball.topToTop(of: self, margin: 70*Dimen.heightMultiplier)
        pokeball.leadingToLeading(of: self, margin: Dimen.leadingMargin)
        pokeball.heightTo(24)
        pokeball.widthTo(24)

        titleLabel.centerVertical(to: pokeball)
        titleLabel.leadingToTrailing(of: pokeball, margin: 16)

        sortButton.topToTop(of: pokeball)
        sortButton.trailingToTrailing(of: self, margin: Dimen.leadingMargin)

        searchTextField.topToBottom(of: titleLabel, margin: 12*Dimen.heightMultiplier)
        searchTextField.leadingToLeading(of: self, margin: 16*Dimen.widthMultiplier)
        searchTextField.centerHorizontal(to: self)
        searchTextField.heightTo(Dimen.textFieldHeight)

        collectionView.topToBottom(of: searchTextField, margin: 16*Dimen.heightMultiplier)
        collectionView.leadingToLeading(of: self, margin: 16)
        collectionView.trailingToTrailing(of: self)
        collectionView.bottomToBottom(of: self)
    }

    func setupSortButton() {
        sortButton.currentImage == .byLetter ? sortButton.setImage(.byNumber, for: .normal) : sortButton.setImage(.byLetter, for: .normal)
    }
}

extension PokedexView: Stylable {
    func setupImages() {
        pokeball.image = .pokeball
        searchTextField.setupSearch()
    }

    func setupColors() {
        backgroundColor = .background
        searchTextField.layer.borderColor = UIColor.lightGray.cgColor
        searchTextField.layer.borderWidth = 2
        searchTextField.layer.cornerRadius = 8
    }

    func setupTexts() {
        titleLabel.text = "Pokédex"
    }

    func setupFonts() {
        titleLabel.font = .boldSystemFont(ofSize: 24)
    }
}

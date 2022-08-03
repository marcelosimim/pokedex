//
//  PokemonDetailsView.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/2/22.
//

import UIKit

class PokemonDetailsView: UIView {

    private let pokemonName = UILabel()
    private let pokemonId = UILabel()
    private let pokeballImage = UIImageView()
    private let pokemonImage = UIImageView()
    private let contentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 45
        return view
    }()
    private let typeView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()
    private let typeLabel = UILabel()
    private let aboutLabel = UILabel()
    private let aboutView = AboutView()
    private let descriptionLabel = UILabel()
    private let baseStatsLabel = UILabel()
    private let statsView = StatsView()

    override func layoutSubviews() {
        setupStyles()
        addViews()
    }

    func setupMainColor(color: UIColor) {
        backgroundColor = color
        typeView.backgroundColor = color
        aboutLabel.textColor = color
        baseStatsLabel.textColor = color
        aboutView.setupMainColor(color: color)
        statsView.setupMainColor(color: color)
    }

    func setupName(name: String) {
        pokemonName.text = name.capitalizingFirstLetter()
    }

    func setupId(id: Int) {
        pokemonId.text = String.formatId(id: id)
    }

    func setupPokemonImage(data: Data) {
        pokemonImage.image = UIImage(data: data)
    }

    func setupType(type: String) {
        typeLabel.text = type.capitalizingFirstLetter()
    }

    func setupDescription(description: String) {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = description.replacingOccurrences(of: "\n", with: " ")
    }

    func setupHeight(height: Int) {
        aboutView.setupHeight(height: height)
    }

    func setupWeight(weight: Int) {
        aboutView.setupWeight(weight: weight)
    }

    func setupMoves(first: String, second: String) {
        aboutView.setupMoves(first: first, second: second)
    }

    func setupStats(stats: [Stat]) {
        statsView.setupStats(stats: stats)
    }

    private func addViews() {
        addSubviews([pokemonName, pokemonId, pokeballImage, contentView, pokemonImage])
        contentView.addSubviews([typeView, aboutLabel, aboutView, descriptionLabel, baseStatsLabel, statsView])
        typeView.addSubviews([typeLabel])
        setupConstraints()
    }

    private func setupConstraints() {
        pokemonName.topToTop(of: self, margin: 90*Dimen.heightMultiplier)
        pokemonName.leadingToLeading(of: self, margin: Dimen.leadingMargin)

        pokemonId.centerVertical(to: pokemonName)
        pokemonId.trailingToTrailing(of: self, margin: Dimen.leadingMargin)

        pokeballImage.topToTop(of: self, margin: 40*Dimen.heightMultiplier)
        pokeballImage.trailingToTrailing(of: self, margin: 8*Dimen.widthMultiplier)
        pokeballImage.heightTo(216*Dimen.widthMultiplier)
        pokeballImage.widthTo(216*Dimen.widthMultiplier)

        pokemonImage.topToBottom(of: pokemonName, margin: 24*Dimen.heightMultiplier)
        pokemonImage.centerHorizontal(to: self)
        pokemonImage.heightTo(200*Dimen.heightMultiplier)
        pokemonImage.widthTo(200*Dimen.heightMultiplier)

        contentView.topToBottom(of: pokeballImage, margin: 8*Dimen.heightMultiplier)
        contentView.leadingToLeading(of: self, margin: 4)
        contentView.centerHorizontal(to: self)
        contentView.bottomToBottom(of: self, margin: 4)

        typeView.topToBottom(of: pokemonImage)
        typeView.centerHorizontal(to: contentView)
        typeView.heightTo(20)
        typeView.leadingToLeading(of: typeLabel, margin: -10)
        typeView.trailingToTrailing(of: typeLabel, margin: -10)

        typeLabel.centerHorizontal(to: typeView)
        typeLabel.centerVertical(to: typeView)

        aboutLabel.topToBottom(of: typeView, margin: 16*Dimen.heightMultiplier)
        aboutLabel.centerHorizontal(to: contentView)

        aboutView.topToBottom(of: aboutLabel, margin: 16*Dimen.heightMultiplier)
        aboutView.leadingToLeading(of: contentView)
        aboutView.trailingToTrailing(of: contentView)

        descriptionLabel.topToBottom(of: aboutView, margin: 32*Dimen.heightMultiplier)
        descriptionLabel.centerHorizontal(to: contentView)

        baseStatsLabel.topToBottom(of: descriptionLabel, margin: 16*Dimen.heightMultiplier)
        baseStatsLabel.centerHorizontal(to: contentView)

        statsView.topToBottom(of: baseStatsLabel, margin: 16*Dimen.heightMultiplier)
        statsView.leadingToLeading(of: self)
        statsView.trailingToTrailing(of: self)
    }
}

extension PokemonDetailsView: Stylable {
    func setupImages() {
        pokeballImage.image = .whitePokeball
        pokemonImage.contentMode = .scaleToFill
    }

    func setupFonts() {
        pokemonName.font = .systemFont(ofSize: 30, weight: .heavy)
        pokemonId.font = .systemFont(ofSize: 16, weight: .heavy)
        typeLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        aboutLabel.font = .systemFont(ofSize: 16, weight: .heavy)
        descriptionLabel.font = .systemFont(ofSize: 12)
        baseStatsLabel.font = .systemFont(ofSize: 16, weight: .heavy)
    }

    func setupColors() {
        pokemonName.textColor = .white
        pokemonId.textColor = .white
        contentView.backgroundColor = .white
        typeLabel.textColor = .white
        descriptionLabel.textColor = .black
    }

    func setupTexts() {
        aboutLabel.text = "About"
        baseStatsLabel.text = "Base Stats"
    }
}

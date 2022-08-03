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
    private let weightImage = UIImageView()
    private let weightValue = UILabel()
    private let weightLabel = UILabel()
    private let lineSeparatorLeft = UIView()
    private let heightImage = UIImageView()
    private let heightValue = UILabel()
    private let heightLabel = UILabel()
    private let lineSeparatorRight = UIView()
    private let firstMove = UILabel()
    private let secondMove = UILabel()
    private let moveLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let baseStatsLabel = UILabel()
    private let baseLineSeparator = UIView()
    private let hpLabel = UILabel()
    private let hpValue = UILabel()
    private let hpBar:UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.layer.cornerRadius = 4
        progress.clipsToBounds = true
        return progress
    }()
    private let atkLabel = UILabel()
    private let atkValue = UILabel()
    private let atkBar:UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.layer.cornerRadius = 4
        progress.clipsToBounds = true
        return progress
    }()
    private let defLabel = UILabel()
    private let defValue = UILabel()
    private let defBar:UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.layer.cornerRadius = 4
        progress.clipsToBounds = true
        return progress
    }()
    private let satkLabel = UILabel()
    private let satkValue = UILabel()
    private let satkBar:UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.layer.cornerRadius = 4
        progress.clipsToBounds = true
        return progress
    }()
    private let sdefLabel = UILabel()
    private let sdefValue = UILabel()
    private let sdefBar:UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.layer.cornerRadius = 4
        progress.clipsToBounds = true
        return progress
    }()
    private let spdLabel = UILabel()
    private let spdValue = UILabel()
    private let spdBar:UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.layer.cornerRadius = 4
        progress.clipsToBounds = true
        return progress
    }()

    override func layoutSubviews() {
        setupStyles()
        addViews()
    }

    func setupMainColor(color: UIColor) {
        backgroundColor = color
        typeView.backgroundColor = color
        aboutLabel.textColor = color
        weightImage.tintColor = color
        heightImage.tintColor = color
        baseStatsLabel.textColor = color
        hpLabel.textColor = color
        atkLabel.textColor = color
        defLabel.textColor = color
        satkLabel.textColor = color
        sdefLabel.textColor = color
        spdLabel.textColor = color
        hpBar.tintColor = color
        hpBar.trackTintColor = color.withAlphaComponent(0.2)
        atkBar.tintColor = color
        atkBar.trackTintColor = color.withAlphaComponent(0.2)
        defBar.tintColor = color
        defBar.trackTintColor = color.withAlphaComponent(0.2)
        satkBar.tintColor = color
        satkBar.trackTintColor = color.withAlphaComponent(0.2)
        sdefBar.tintColor = color
        sdefBar.trackTintColor = color.withAlphaComponent(0.2)
        spdBar.tintColor = color
        spdBar.trackTintColor = color.withAlphaComponent(0.2)
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

    func setupHeight(height: Int) {
        heightValue.text = "\(height) m"
    }

    func setupWeight(weight: Int) {
        weightValue.text = "\(weight) kg"
    }

    func setupMoves(first: String, second: String) {
        firstMove.text = first.capitalizingFirstLetter()
        secondMove.text = second.capitalizingFirstLetter()
    }

    func setupDescription(description: String) {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = description.replacingOccurrences(of: "\n", with: " ")
    }

    func setupStats(stats: [Stat]) {
        hpValue.text = String.formatStat(stat: stats[0].baseStat ?? 0)
        hpBar.setProgress(percentage(value: stats[0].baseStat ?? 0), animated: true)
        atkValue.text = String.formatStat(stat: stats[1].baseStat ?? 0)
        atkBar.setProgress(percentage(value: stats[1].baseStat ?? 0), animated: true)
        defValue.text = String.formatStat(stat: stats[2].baseStat ?? 0)
        defBar.setProgress(percentage(value: stats[2].baseStat ?? 0), animated: true)
        satkValue.text = String.formatStat(stat: stats[3].baseStat ?? 0)
        satkBar.setProgress(percentage(value: stats[3].baseStat ?? 0), animated: true)
        sdefValue.text = String.formatStat(stat: stats[4].baseStat ?? 0)
        sdefBar.setProgress(percentage(value: stats[4].baseStat ?? 0), animated: true)
        spdValue.text = String.formatStat(stat: stats[5].baseStat ?? 0)
        spdBar.setProgress(percentage(value: stats[5].baseStat ?? 0), animated: true)
    }

    private func percentage(value: Int) -> Float {
        return Float(value)/300
    }

    private func addViews() {
        addSubviews([pokemonName, pokemonId, pokeballImage, contentView, pokemonImage])
        contentView.addSubviews([typeView, aboutLabel, weightImage, weightValue, weightLabel, lineSeparatorLeft, heightImage, heightValue, heightLabel, lineSeparatorRight, firstMove, secondMove, moveLabel, descriptionLabel, baseStatsLabel, baseLineSeparator, hpLabel, atkLabel, defLabel, satkLabel, sdefLabel, spdLabel, hpValue, atkValue, defValue, satkValue, sdefValue, spdValue, hpBar, atkBar, defBar, satkBar, sdefBar, spdBar])
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
        pokemonImage.heightTo(200*Dimen.widthMultiplier)
        pokemonImage.widthTo(200*Dimen.widthMultiplier)

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

        weightImage.topToBottom(of: aboutLabel, margin: 24*Dimen.heightMultiplier)
        weightImage.leadingToLeading(of: contentView, margin: 45.5*Dimen.widthMultiplier)
        weightValue.leadingToTrailing(of: weightImage, margin: 8)
        weightValue.centerVertical(to: weightImage)
        weightLabel.topToBottom(of: weightValue, margin: 8*Dimen.heightMultiplier)
        weightLabel.leadingToTrailing(of: weightImage)

        lineSeparatorLeft.leadingToTrailing(of: weightValue, margin: 24*Dimen.widthMultiplier)
        lineSeparatorLeft.bottomToBottom(of: weightLabel)
        lineSeparatorLeft.heightTo(48)
        lineSeparatorLeft.widthTo(1)

        heightImage.topToBottom(of: aboutLabel, margin: 24*Dimen.heightMultiplier)
        heightImage.leadingToTrailing(of: lineSeparatorLeft, margin: Dimen.leadingMargin)
        heightImage.transform = transform.rotated(by: .pi/2)
        heightValue.leadingToTrailing(of: heightImage, margin: 8)
        heightValue.centerVertical(to: heightImage)
        heightLabel.topToBottom(of: heightValue, margin: 8*Dimen.heightMultiplier)
        heightLabel.leadingToTrailing(of: heightImage)

        lineSeparatorRight.leadingToTrailing(of: heightValue, margin: 24*Dimen.widthMultiplier)
        lineSeparatorRight.bottomToBottom(of: heightLabel)
        lineSeparatorRight.heightTo(48)
        lineSeparatorRight.widthTo(1)

        firstMove.topToBottom(of: aboutLabel, margin: 16*Dimen.heightMultiplier)
        firstMove.leadingToTrailing(of: lineSeparatorRight, margin: Dimen.leadingMargin)
        secondMove.topToBottom(of: firstMove, margin: 2*Dimen.heightMultiplier)
        secondMove.leadingToTrailing(of: lineSeparatorRight, margin: Dimen.leadingMargin)

        moveLabel.topToTop(of: heightLabel)
        moveLabel.centerHorizontal(to: firstMove)

        descriptionLabel.topToBottom(of: moveLabel, margin: 32*Dimen.heightMultiplier)
        descriptionLabel.centerHorizontal(to: contentView)

        baseStatsLabel.topToBottom(of: descriptionLabel, margin: 16*Dimen.heightMultiplier)
        baseStatsLabel.centerHorizontal(to: contentView)

        baseLineSeparator.topToBottom(of: baseStatsLabel, margin: 16*Dimen.heightMultiplier)
        baseLineSeparator.leadingToLeading(of: contentView, margin: 60*Dimen.widthMultiplier)
        baseLineSeparator.heightTo(100)
        baseLineSeparator.widthTo(1)

        hpLabel.trailingToLeading(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        hpLabel.topToTop(of: baseLineSeparator)
        hpValue.leadingToTrailing(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        hpValue.centerVertical(to: hpLabel)
        hpBar.leadingToTrailing(of: hpValue, margin: 8*Dimen.widthMultiplier)
        hpBar.trailingToTrailing(of: contentView, margin: Dimen.leadingMargin)
        hpBar.centerVertical(to: hpLabel)
        hpBar.heightTo(4)

        atkLabel.trailingToLeading(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        atkLabel.topToBottom(of: hpLabel, margin: 2)
        atkValue.leadingToTrailing(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        atkValue.centerVertical(to: atkLabel)
        atkBar.leadingToTrailing(of: atkValue, margin: 8*Dimen.widthMultiplier)
        atkBar.trailingToTrailing(of: contentView, margin: Dimen.leadingMargin)
        atkBar.centerVertical(to: atkLabel)
        atkBar.heightTo(4)

        defLabel.trailingToLeading(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        defLabel.topToBottom(of: atkLabel, margin: 2)
        defValue.leadingToTrailing(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        defValue.centerVertical(to: defLabel)
        defBar.leadingToTrailing(of: defValue, margin: 8*Dimen.widthMultiplier)
        defBar.trailingToTrailing(of: contentView, margin: Dimen.leadingMargin)
        defBar.centerVertical(to: defLabel)
        defBar.heightTo(4)

        satkLabel.trailingToLeading(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        satkLabel.topToBottom(of: defLabel, margin: 2)
        satkValue.leadingToTrailing(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        satkValue.centerVertical(to: satkLabel)
        satkBar.leadingToTrailing(of: satkValue, margin: 8*Dimen.widthMultiplier)
        satkBar.trailingToTrailing(of: contentView, margin: Dimen.leadingMargin)
        satkBar.centerVertical(to: satkLabel)
        satkBar.heightTo(4)

        sdefLabel.trailingToLeading(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        sdefLabel.topToBottom(of: satkLabel, margin: 2)
        sdefValue.leadingToTrailing(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        sdefValue.centerVertical(to: sdefLabel)
        sdefBar.leadingToTrailing(of: sdefValue, margin: 8*Dimen.widthMultiplier)
        sdefBar.trailingToTrailing(of: contentView, margin: Dimen.leadingMargin)
        sdefBar.centerVertical(to: sdefLabel)
        sdefBar.heightTo(4)

        spdLabel.trailingToLeading(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        spdLabel.topToBottom(of: sdefLabel, margin: 2)
        spdValue.leadingToTrailing(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        spdValue.centerVertical(to: spdLabel)
        spdBar.leadingToTrailing(of: spdValue, margin: 8*Dimen.widthMultiplier)
        spdBar.trailingToTrailing(of: contentView, margin: Dimen.leadingMargin)
        spdBar.centerVertical(to: spdLabel)
        spdBar.heightTo(4)
    }
}

extension PokemonDetailsView: Stylable {
    func setupImages() {
        pokeballImage.image = .whitePokeball
        pokemonImage.contentMode = .scaleToFill
        weightImage.image = .scale
        heightImage.image = .ruler
    }

    func setupFonts() {
        pokemonName.font = .systemFont(ofSize: 30, weight: .heavy)
        pokemonId.font = .systemFont(ofSize: 16, weight: .heavy)
        typeLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        aboutLabel.font = .systemFont(ofSize: 16, weight: .heavy)
        weightValue.font = .systemFont(ofSize: 12)
        weightLabel.font = .systemFont(ofSize: 10)
        heightValue.font = .systemFont(ofSize: 12)
        heightLabel.font = .systemFont(ofSize: 10)
        firstMove.font = .systemFont(ofSize: 12)
        secondMove.font = .systemFont(ofSize: 12)
        moveLabel.font = .systemFont(ofSize: 10)
        descriptionLabel.font = .systemFont(ofSize: 12)
        baseStatsLabel.font = .systemFont(ofSize: 16, weight: .heavy)
        hpLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        atkLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        defLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        satkLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        sdefLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        spdLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        hpValue.font = .systemFont(ofSize: 11)
        atkValue.font = .systemFont(ofSize: 11)
        defValue.font = .systemFont(ofSize: 11)
        satkValue.font = .systemFont(ofSize: 11)
        sdefValue.font = .systemFont(ofSize: 11)
        spdValue.font = .systemFont(ofSize: 11)
    }

    func setupColors() {
        pokemonName.textColor = .white
        pokemonId.textColor = .white
        contentView.backgroundColor = .white
        typeLabel.textColor = .white
        weightValue.textColor = .black
        weightLabel.textColor = .mediumGray
        lineSeparatorLeft.backgroundColor = .lightGray
        heightValue.textColor = .black
        heightLabel.textColor = .mediumGray
        lineSeparatorRight.backgroundColor = .lightGray
        firstMove.textColor = .black
        secondMove.textColor = .black
        moveLabel.textColor = .mediumGray
        descriptionLabel.textColor = .black
        baseLineSeparator.backgroundColor = .lightGray
    }

    func setupTexts() {
        aboutLabel.text = "Sobre"
        weightLabel.text = "Peso"
        heightLabel.text = "Altura"
        moveLabel.text = "Movimentos"
        baseStatsLabel.text = "Estatísticas básicas"
        hpLabel.text = "HP"
        atkLabel.text = "ATK"
        defLabel.text = "DEF"
        satkLabel.text = "SATK"
        sdefLabel.text = "SDEF"
        spdLabel.text = "SPD"
    }
}

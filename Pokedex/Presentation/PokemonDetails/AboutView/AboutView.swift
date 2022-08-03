//
//  AboutView.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/3/22.
//

import UIKit

class AboutView: UIView {

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

    override func layoutSubviews() {
        setupStyles()
        addViews()
    }

    func setupMainColor(color: UIColor) {
        backgroundColor = .white
        weightImage.tintColor = color
        heightImage.tintColor = color
    }

    func setupHeight(height: Int) {
        heightValue.text = "\(Float(height)/10) m"
    }

    func setupWeight(weight: Int) {
        weightValue.text = "\(weight) kg"
    }

    func setupMoves(first: String, second: String) {
        firstMove.text = first.capitalizingFirstLetter()
        secondMove.text = second.capitalizingFirstLetter()
    }

    private func addViews() {
        addSubviews([weightImage, weightValue, weightLabel, lineSeparatorLeft, heightImage, heightValue, heightLabel, lineSeparatorRight, firstMove, secondMove, moveLabel])
        setupConstraints()
    }

    private func setupConstraints() {
        weightImage.topToTop(of: self, margin: 24*Dimen.heightMultiplier)
        weightImage.leadingToLeading(of: self, margin: 45.5*Dimen.widthMultiplier)
        weightValue.leadingToTrailing(of: weightImage, margin: 8)
        weightValue.centerVertical(to: weightImage)
        weightLabel.topToBottom(of: weightValue, margin: 8*Dimen.heightMultiplier)
        weightLabel.leadingToTrailing(of: weightImage)

        lineSeparatorLeft.leadingToTrailing(of: weightValue, margin: 24*Dimen.widthMultiplier)
        lineSeparatorLeft.bottomToBottom(of: weightLabel)
        lineSeparatorLeft.heightTo(48)
        lineSeparatorLeft.widthTo(1)

        heightImage.topToTop(of: self, margin: 24*Dimen.heightMultiplier)
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

        firstMove.topToTop(of: self, margin: 16*Dimen.heightMultiplier)
        firstMove.leadingToTrailing(of: lineSeparatorRight, margin: Dimen.leadingMargin)
        secondMove.topToBottom(of: firstMove, margin: 2*Dimen.heightMultiplier)
        secondMove.leadingToTrailing(of: lineSeparatorRight, margin: Dimen.leadingMargin)

        moveLabel.topToTop(of: heightLabel)
        moveLabel.centerHorizontal(to: firstMove)
        moveLabel.bottomToBottom(of: self)
    }
}

extension AboutView: Stylable {
    func setupImages() {
        weightImage.image = .scale
        heightImage.image = .ruler
    }

    func setupFonts() {
        weightValue.font = .systemFont(ofSize: 12)
        weightLabel.font = .systemFont(ofSize: 10)
        heightValue.font = .systemFont(ofSize: 12)
        heightLabel.font = .systemFont(ofSize: 10)
        firstMove.font = .systemFont(ofSize: 12)
        secondMove.font = .systemFont(ofSize: 12)
        moveLabel.font = .systemFont(ofSize: 10)
    }

    func setupColors() {
        weightValue.textColor = .black
        weightLabel.textColor = .mediumGray
        lineSeparatorLeft.backgroundColor = .lightGray
        heightValue.textColor = .black
        heightLabel.textColor = .mediumGray
        lineSeparatorRight.backgroundColor = .lightGray
        firstMove.textColor = .black
        secondMove.textColor = .black
        moveLabel.textColor = .mediumGray
    }

    func setupTexts() {
        weightLabel.text = "Weight"
        heightLabel.text = "Height"
        moveLabel.text = "Moves"
    }
}

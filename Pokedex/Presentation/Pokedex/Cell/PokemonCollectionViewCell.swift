//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/1/22.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    static let identifier = "\(PokemonCollectionViewCell.self)"

    private let cellBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let numberLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 8
        addViews()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }

    private func addViews() {
        contentView.addSubviews([cellBackground, nameLabel])
        cellBackground.addSubviews([numberLabel, imageView])
        setupConstraints()
    }

    private func setupConstraints() {
        cellBackground.topToTop(of: contentView, margin: 2)
        cellBackground.leadingToLeading(of: contentView, margin: 2)
        cellBackground.trailingToTrailing(of: contentView, margin: 2)
        cellBackground.bottomToBottom(of: contentView, margin: 24*Dimen.heightMultiplier)

        numberLabel.trailingToTrailing(of: cellBackground, margin: 8*Dimen.widthMultiplier)
        numberLabel.topToTop(of: cellBackground, margin: 2)

        imageView.topToTop(of: cellBackground, margin: 16*Dimen.heightMultiplier)
        imageView.leadingToLeading(of: cellBackground, margin: 16*Dimen.widthMultiplier)
        imageView.centerHorizontal(to: cellBackground)
        imageView.bottomToBottom(of: cellBackground)

        nameLabel.topToBottom(of: cellBackground, margin: 4*Dimen.heightMultiplier)
        nameLabel.leadingToLeading(of: contentView, margin: 16*Dimen.widthMultiplier)
        nameLabel.centerHorizontal(to: cellBackground)
        nameLabel.bottomToBottom(of: contentView, margin: 4*Dimen.heightMultiplier)
    }

    func setupName(name: String) {
        nameLabel.text = name
        nameLabel.textColor = .white
        nameLabel.adjustsFontSizeToFitWidth = true
    }

    func setupNumber(number: String) {
        numberLabel.text = "#\(number)"
        numberLabel.font = .systemFont(ofSize: 10)
    }

    func setupImage(data: Data?) {
        guard let data = data else { return }
        imageView.image = UIImage(data: data)
    }

    func setupMainColor(color: UIColor) {
        contentView.backgroundColor = color
        numberLabel.textColor = color
        cellBackground.backgroundColor = .white
    }
}
//
//  ViewController.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/1/22.
//

import UIKit

class PokedexViewController: UIViewController {

    private let pokedexView = PokedexView.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = pokedexView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pokedexView.collectionView.dataSource = self
        pokedexView.collectionView.delegate = self
    }
}

extension PokedexViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier, for: indexPath) as? PokemonCollectionViewCell else {
            fatalError()
        }

        cell.setupName(name: "Pokemon")
        cell.setupImage(image: .pokeball)
        cell.setupBackgroundColor(color: .grass)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Dimen.cellWidth, height: Dimen.cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 16)
    }
}

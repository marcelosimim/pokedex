//
//  ViewController.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/1/22.
//

import UIKit

class PokedexViewController: UIViewController {

    private let pokedexView = PokedexView.init()
    private let viewModel = AppContainer.shared.resolve(PokedexViewModel.self)!

    override func viewDidLoad() {
        super.viewDidLoad()
        view = pokedexView
        pokedexView.setupSortButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pokedexView.collectionView.dataSource = self
        pokedexView.collectionView.delegate = self
        setupViewModelBinds()
        setupButton()
        viewModel.getAll()
    }

    private func setupViewModelBinds() {
        viewModel.pokemons.bindWithoutFire { _ in
            DispatchQueue.main.async {
                self.pokedexView.collectionView.reloadData()
            }
        }
    }

    private func setupButton() {
        pokedexView.sortButton.addTarget(self, action: #selector(didTapSort), for: .touchUpInside)
    }

    @objc private func didTapSort() {
        pokedexView.setupSortButton()
        viewModel.isAscending ? viewModel.sortByNumber() : viewModel.sortByLetter()
    }
}

extension PokedexViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.pokemons.value.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier, for: indexPath) as? PokemonCollectionViewCell else {
            fatalError()
        }
        let pokemon = viewModel.pokemons.value[indexPath.row]
        cell.setupName(name: pokemon.name ?? "")
        cell.setupNumber(number: pokemon.id ?? 0)
        cell.setupImage(data: pokemon.image)
        cell.setupMainColor(color: UIColor(named: pokemon.types?[0].type?.name ?? "") ?? .lightGray)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Dimen.cellWidth, height: Dimen.cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 16)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newController = PokemonDetailsViewController.init()
        newController.pokemons = viewModel.pokemons.value
        newController.indexPath = indexPath.row
        navigationController?.pushViewController(newController, animated: true)
    }
}

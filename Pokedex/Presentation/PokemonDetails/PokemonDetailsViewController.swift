//
//  PokemonDetailsViewController.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/2/22.
//

import UIKit

class PokemonDetailsViewController: UIViewController {

    private let detailsView = PokemonDetailsView.init()
    private let viewModel = AppContainer.shared.resolve(PokemonDetailsViewModel.self)!
    var pokemons: [Pokemon]?
    var indexPath: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailsView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let pokemons = pokemons, let index = indexPath else { return }
        setupViewModelBinds()
        viewModel.setPokemon(pokemon: pokemons[index])
    }

    private func setupViewModelBinds() {
        viewModel.mainColor.bindWithoutFire { color in
            guard let color = color else { return }
            self.detailsView.setupMainColor(color: color)
            self.navigationController?.navigationBar.tintColor = color.darker(by: 30)
        }
        viewModel.name.bindWithoutFire { name in
            guard let name = name else { return }
            self.detailsView.setupName(name: name)
        }
        viewModel.id.bindWithoutFire { id in
            guard let id = id else { return }
            self.detailsView.setupId(id: id)
        }
        viewModel.image.bindWithoutFire { data in
            guard let data = data else { return }
            self.detailsView.setupPokemonImage(data: data)
        }
        viewModel.description.bindWithoutFire { description in
            guard let description = description, let flavor = description.flavor_text_entries, let text = flavor[0].flavor_text else { return }
            DispatchQueue.main.async {
                self.detailsView.setupDescription(description: text)
            }
        }
        viewModel.type.bindWithoutFire { type in
            guard let type = type else { return }
             self.detailsView.setupType(type: type)
        }
        viewModel.height.bindWithoutFire { height in
            guard let height = height else { return }
            self.detailsView.setupHeight(height: height)
        }
        viewModel.weight.bindWithoutFire { weight in
            guard let weight = weight else { return }
            self.detailsView.setupWeight(weight: weight)
        }
        viewModel.moves.bindWithoutFire { moves in
            guard let moves = moves, let first = moves[0].move?.name, let second = moves[1].move?.name else { return }
            self.detailsView.setupMoves(first: first, second: second)
        }
        viewModel.stats.bindWithoutFire { stats in
            guard let stats = stats else { return }
            self.detailsView.setupStats(stats: stats)
        }
    }
}

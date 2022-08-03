//
//  DefaultPokeAPIRepository.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/1/22.
//

import Foundation

final class DefaultPokeAPIRepository: PokeAPIRepository {
    private let baseUrl = "https://pokeapi.co/api/v2"

    func getAll(completion: @escaping([PokemonModel]?) -> ()) {
        getPokedex { pokedex in
            let numberOfPokemons = pokedex.results.count
            var pokemons = Array(repeating: PokemonModel(), count: numberOfPokemons)
            for index in 0...(numberOfPokemons-1) {
                let url =  pokedex.results[index].url 
                self.getPokemonInfo(url: url) { pokemon in
                    pokemons[index] = pokemon.toModel()
                    let imageUrl = pokemon.sprites?.other?.officialArtwork.frontDefault ?? ""
                    self.getImageData(from: imageUrl) { data, response, error in
                        guard let data = data else {
                            completion(pokemons)
                            return
                        }
                        pokemons[index].image = data
                        completion(pokemons)
                    }
                }
            }
        }
    }

    private func getPokedex(completion: @escaping (PokedexEntity) -> ()) {
        guard let sourceURL = URL(string: "\(baseUrl)/pokemon?limit=500&offset=0") else { return }

        URLSession.shared.dataTask(with: sourceURL) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let results = try decoder.decode(PokedexEntity.self, from: data)
                    completion(results)
                } catch {
                    return
                }
            }
        }.resume()
    }

    private func getPokemonInfo(url: String, completion: @escaping (PokemonEntity) -> ()) {
        guard let sourceURL = URL(string: url) else { return }

        URLSession.shared.dataTask(with: sourceURL) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(PokemonEntity.self, from: data)
                    completion(result)
                } catch (let error){
                    print("error \(error)")
                }
            }
        }.resume()
    }

    func getDescription(id: Int, completion: @escaping (DescriptionModel?) -> ()) {
        guard let sourceURL = URL(string: "\(baseUrl)/pokemon-species/\(id)") else { return }

        URLSession.shared.dataTask(with: sourceURL) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(DescripitonEntity.self, from: data)
                    completion(result.toModel())
                } catch (let error){
                    print("error \(error)")
                }
            }
        }.resume()
    }
}

extension DefaultPokeAPIRepository {
    func getImageData(from url: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}

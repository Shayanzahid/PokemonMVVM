//
//  PokemonViewModel.swift
//  PokeMVVM
//
//  Created by Shayan on 11/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import Foundation

struct PokemonViewModel {
    let creature: Creature
}

extension PokemonViewModel {
    var name: String {
        return creature.name
    }
}

class PokemonListViewModel {
    var pokemonViewModels: [PokemonViewModel]
    
    init() {
        pokemonViewModels = [PokemonViewModel]()
    }
}

extension PokemonListViewModel {
    func pokemonViewModel(at index: Int) -> PokemonViewModel {
        return pokemonViewModels[index]
    }
}

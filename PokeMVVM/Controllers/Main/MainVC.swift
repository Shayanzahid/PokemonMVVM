//
//  ViewController.swift
//  PokeMVVM
//
//  Created by Shayan on 11/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import UIKit

final class MainVC: UIViewController {
    private let mainView = MainView()
    
    private var pokemonListViewModel = PokemonListViewModel()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPokemon()
    }
    
    private func loadPokemon() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100") else {
            fatalError("The URL is incorrect")
        }
        
        let resource = Resource<Pokemon>(url: url)
        
        Webservice().load(resource: resource) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case .success(let pokemon):
                    self.pokemonListViewModel.pokemonViewModels = pokemon.results!.map(PokemonViewModel.init)
                    print(self.pokemonListViewModel.pokemonViewModel(at: 0))
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}


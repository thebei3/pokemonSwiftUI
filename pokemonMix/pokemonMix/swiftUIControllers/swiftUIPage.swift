//
//  swiftUIpage.swift
//  pokemonMix
//
//  Created by Orhun Akmil on 22.03.2024.
//

import Foundation
import SwiftUI


struct swiftUIPage: View {
    @State private var selectedPokemon: PokemonViewModel?
    @State private var pokemons: [PokemonViewModel] = []

    var body: some View {
        NavigationView {
            List {
                ForEach(pokemons, id: \.id) { pokemon in
                    NavigationLink(destination: PokemonDetailView(pokemon: pokemon), tag: pokemon, selection: $selectedPokemon) {
                        PokemonListRowView(pokemon: pokemon)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Pokemon")
            .onAppear {
                fetchData()
                configureNavigationBarAppearance()
            }
        }
        
    }
    
    func fetchData() {
        guard let url = URL(string: PokeKey.pokemonListapiUrl) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                let decoder = JSONDecoder()
                let pokemons = try decoder.decode([PokemonViewModel].self, from: data)
                DispatchQueue.main.async {
                    self.pokemons = pokemons
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }

    func configureNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(hex: "#5856D6")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().prefersLargeTitles = false
    }
}



//
//  PokemonViewModel.swift
//  pokemonapp
//
//  Created by Orhun Akmil on 21.03.2024.
//

import Foundation

struct PokemonViewModel : Codable , Identifiable, Hashable {

    var name: String?
    var description: String?
    var imageUrl: String?
    var id : Int?
}

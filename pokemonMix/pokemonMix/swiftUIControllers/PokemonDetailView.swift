//
//  PokemonDetailView.swift
//  pokemonMix
//
//  Created by Orhun Akmil on 22.03.2024.
//

import Foundation
import SwiftUI

struct PokemonDetailView: View {
    let pokemon: PokemonViewModel
    @State private var image: UIImage?

    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 120)
            } else {
                // Eğer resim yüklenmediyse, bir placeholder gösterilebilir
                PlaceholderView()
            }
            Text(pokemon.description ?? "")
                .padding()
           
        }
        .navigationTitle(pokemon.name ?? "")
        .onAppear {
            loadImage()
        }
        Spacer() 
    }
    
    private func loadImage() {
        guard let imageUrl = URL(string: pokemon.imageUrl ?? "") else { return }
        
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            guard let data = data, error == nil else { return }
            if let loadedImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = loadedImage // Resmi yükle ve state'i güncelle
                }
            }
        }.resume()
    }
}


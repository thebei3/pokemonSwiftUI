//
//  PokemonListRowView.swift
//  pokemonMix
//
//  Created by Orhun Akmil on 22.03.2024.
//

import Foundation
import SwiftUI


struct PokemonListRowView: View {
    let pokemon: PokemonViewModel
    @State private var image: UIImage?

    var body: some View {
        HStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 90)
            } else {
                // Eğer resim yüklenmediyse, bir placeholder gösterilebilir
                PlaceholderView()
            }
            
            VStack(alignment: .leading) {
                Text(pokemon.name ?? "")
                    .font(.headline)
                Text(pokemon.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .onAppear {
            loadImage()
        }
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



//
//  PokemonDetailViewController.swift
//  pokemonapp
//
//  Created by Orhun Akmil on 21.03.2024.
//

import Foundation
import UIKit


class PokemonDetailViewController : UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    
    var selectedCellForDetail : PokemonViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedCellForDetail?.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configPage()
    }
    
    
    func configPage() {
        let pokemonDetailView : PokemonDetail = .fromNib()
        
        if let imageURL = URL(string: selectedCellForDetail?.imageUrl ?? "") {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageURL) {
                    DispatchQueue.main.async {
                        pokemonDetailView.imageView.image = UIImage(data: data)
                    }
                }
            }
        }
        
        pokemonDetailView.descriptionLabel.text = selectedCellForDetail?.description
        pokemonDetailView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(pokemonDetailView)
        NSLayoutConstraint.activate([
         pokemonDetailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0)
        ,pokemonDetailView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ,pokemonDetailView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0)
        ,pokemonDetailView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)])
    }
    

}

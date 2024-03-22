//
//  PokemonTableViewCell.swift
//  pokemonapp
//
//  Created by Orhun Akmil on 21.03.2024.
//

import Foundation
import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

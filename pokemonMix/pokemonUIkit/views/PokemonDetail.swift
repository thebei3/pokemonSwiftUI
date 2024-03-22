//
//  PokemonDetail.swift
//  pokemonapp
//
//  Created by Orhun Akmil on 21.03.2024.
//

import Foundation
import UIKit


class PokemonDetail : UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

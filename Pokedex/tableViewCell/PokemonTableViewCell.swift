//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by T Thirayut on 15/3/2567 BE.
//

import UIKit
import SDWebImage

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
    }
    
    func setPokemon(viewModel : Pokemon){
        
        pokemonName.text = viewModel.name
        if let url = URL(string: viewModel.imageURL){
            self.pokemonImage.sd_setImage(with: url)
            
        }
    }
    
}

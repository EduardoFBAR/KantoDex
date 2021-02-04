//
//  DexEntryCell.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 1/2/21.
//

import UIKit
import SDWebImage

struct DexEntryCellData {
    
    init (pokemonBasicModel: PokemonBasicModel) {
        self.pokemonBasicModel = pokemonBasicModel
    }
    
    var pokemonBasicModel: PokemonBasicModel
}

class DexEntryCell: BaseTableViewCell {
    
    @IBOutlet var imagePokemon: UIImageView!
    @IBOutlet var labelPokemonName: UILabel!
    @IBOutlet var labelPokemonId: UILabel!
    
    var pokemonBasicModel: PokemonBasicModel?
    
    override func setData(_ data: Any?) {
        if let data = data as? DexEntryCellData {
            
            pokemonBasicModel = data.pokemonBasicModel
            
            if let pokemonId = pokemonBasicModel?.id, let intId = Int(pokemonId) {
                labelPokemonId.text = "#" + String(format: "%03d", intId)
            }
            
            if let pokemonName = pokemonBasicModel?.name {
                labelPokemonName.text = pokemonName
            }
            
            if let pokemonImage = pokemonBasicModel?.image {
                let imageUrl = URL(string: pokemonImage)
                imagePokemon.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: IMAGE_PLACEHOLDER_CELL))
            }
        }
    }
    
}

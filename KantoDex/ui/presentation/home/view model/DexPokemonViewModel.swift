//
//  DexPokemonViewModel.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 1/2/21.
//

import Foundation

public class DexPokemonViewModel: NSObject {
   
    func getModelViewList(from arrayPokemons: [PokedexEntryDto], with offset: Int) -> [PokemonBasicModel] {
        var items: [PokemonBasicModel] = []
        
        for entryIndex in 0..<arrayPokemons.count {
            let name = arrayPokemons[entryIndex].name?.capitalized
            let id = String(entryIndex + offset + 1)
            let image = BASE_URL_IMAGE_CELL + String(id) + ".png"
            let pokemonViewModel = PokemonBasicModel(id: id, image: image, name: name)
            items.append(pokemonViewModel)
            if id == "151" {
                break
            }
        }
        
        return items
    }
    
}

//
//  DetailPokemonViewModel.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 2/2/21.
//

import Foundation

public class DetailPokemonViewModel: NSObject {
   
    func getModelView(pokemonInfo: PokemonInfoDto, pokemonSpecies: PokemonSpeciesDto) -> PokemonDetailModel {
        
        var item = PokemonDetailModel(captureRate: pokemonSpecies.captureRate, description: pokemonSpecies.description, habitat: pokemonSpecies.habitat, happiness: pokemonSpecies.happiness, height: pokemonInfo.height, id: pokemonInfo.id, image: pokemonInfo.detailImage, isLegendary: pokemonSpecies.isLegendary, weight: pokemonInfo.weight)
        
        if let types = pokemonInfo.types {
            if types.count == 1 {
                item.type = types[0]
            } else if types.count == 2 {
                item.type = types[0] + " / " + types[1]
            }
        }
        return item
    }
    
}

//
//  DetailRepository.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 2/2/21.
//

import Foundation

class DetailRepository: DetailDataRepository {
    
    func getPokemonSpecies(dataSource: DetailDataSource, id: String) {
        
        let network = NetworkLayer()
        
        network.setFinishHandler{(result) -> () in
            dataSource.onGetPokemonSpeciesSuccess(pokemonSpecies: result as? PokemonSpeciesDto)
        }
        
        network.setErrorHandler{(result) -> () in
            dataSource.onGetPokemonSpeciesError(error: result as? String)
        }
        
        network.requestAPI(api: .GetSpecies(id), parameters: nil, headers: ["Content-Type": "application/json", "accept": "application/json"])
    }
    
    func getPokemonInfo(dataSource: DetailDataSource, id: String) {
        
        let network = NetworkLayer()
        
        network.setFinishHandler{(result) -> () in
            dataSource.onGetPokemonInfoSuccess(pokemonInfo: result as? PokemonInfoDto)
        }
        
        network.setErrorHandler{(result) -> () in
            dataSource.onGetPokemonInfoError(error: result as? String)
        }
        
        network.requestAPI(api: .GetPokemonInfo(id), parameters: nil, headers: ["Content-Type": "application/json", "accept": "application/json"])
    }
    
}

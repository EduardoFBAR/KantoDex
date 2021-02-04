//
//  DexRepository.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 1/2/21.
//

import Foundation

class DexRepository: DexDataRepository {
    
    func getPokedexEntries(dataSource: DexDataSource, offset: Int, limit: Int) {
        
        let network = NetworkLayer()
        
        network.setFinishHandler{(result) -> () in
            dataSource.onGetPokedexEntriesSuccess(pokedexEntries: result as? [PokedexEntryDto])
        }
        
        network.setErrorHandler{(result) -> () in
            dataSource.onGetPokedexEntriesError(error: result as? String)
        }
        
        network.requestAPI(api: .GetPokedex(String(offset), String(limit)), parameters: nil, headers: ["Content-Type": "application/json", "accept": "application/json"])
    }
    
}

//
//  DexDataSource.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 1/2/21.
//

import Foundation

protocol DexDataSource {
    func onGetPokedexEntriesSuccess(pokedexEntries: [PokedexEntryDto]?)
    func onGetPokedexEntriesError(error: String?)
}

protocol DexDataRepository {
    func getPokedexEntries(dataSource: DexDataSource, offset: Int, limit: Int)
}

//
//  DetailDataSource.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 2/2/21.
//

import Foundation

protocol DetailDataSource {
    func onGetPokemonSpeciesSuccess(pokemonSpecies: PokemonSpeciesDto?)
    func onGetPokemonSpeciesError(error: String?)
    func onGetPokemonInfoSuccess(pokemonInfo: PokemonInfoDto?)
    func onGetPokemonInfoError(error: String?)
}

protocol DetailDataRepository {
    func getPokemonSpecies(dataSource: DetailDataSource, id: String)
    func getPokemonInfo(dataSource: DetailDataSource, id: String)
}

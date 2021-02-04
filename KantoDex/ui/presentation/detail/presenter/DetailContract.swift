//
//  DetailContract.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 2/2/21.
//

import Foundation

public protocol DetailContractView {
    func showLoading()
    func hideLoading()
    func showAlert(message: String)
    func setPokemonData(pokemonData: PokemonDetailModel)
}

public protocol DetailContractPresenter {
    var id: String? { get }
    
    func getPokemonInfo(detailView: DetailContractView)
    func getPokemonSpecies(detailView: DetailContractView)
}

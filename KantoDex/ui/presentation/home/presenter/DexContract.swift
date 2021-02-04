//
//  DexContract.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 1/2/21.
//

import Foundation

public protocol DexContractView {
    func showLoading()
    func hideLoading()
    func showAlert(message: String)
    func setPokedexData(pokedexEntries: [PokemonBasicModel])
    func setPokedexError()
}

public protocol DexContractPresenter {
    var pageNum: Int { get }
    
    func getPokedexEntries(dexView: DexContractView)
}

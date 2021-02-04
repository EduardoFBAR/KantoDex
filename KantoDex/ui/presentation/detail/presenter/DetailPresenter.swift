//
//  DetailPresenter.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 2/2/21.
//

import Foundation

class DetailPresenter: DetailContractPresenter {
    
    var view: DetailContractView?
    var repository: DetailRepository?
    var id: String?
    var pokemonSpecies: PokemonSpeciesDto?
    
    init(repository: DetailRepository, id: String) {
        self.repository = repository
        self.id = id
    }
    
    func getPokemonSpecies(detailView: DetailContractView) {
        if let pokemonId = id {
            view = detailView
            view?.showLoading()
            repository?.getPokemonSpecies(dataSource: self, id: pokemonId)
        }
    }
    
    func getPokemonInfo(detailView: DetailContractView) {
        if let pokemonId = id {
            view = detailView
            view?.showLoading()
            repository?.getPokemonInfo(dataSource: self, id: pokemonId)
        }
    }
    
}

extension DetailPresenter: DetailDataSource {
    func onGetPokemonSpeciesSuccess(pokemonSpecies: PokemonSpeciesDto?) {
        if let pokemonId = id, let species = pokemonSpecies {
            self.pokemonSpecies = species
            repository?.getPokemonInfo(dataSource: self, id: pokemonId)
        }
    }
    
    func onGetPokemonSpeciesError(error: String?) {
        view?.showAlert(message: "Details could not be loaded")
        view?.hideLoading()
    }
    
    func onGetPokemonInfoSuccess(pokemonInfo: PokemonInfoDto?) {
        if let info = pokemonInfo, let species = pokemonSpecies {
            let viewModel = DetailPokemonViewModel().getModelView(pokemonInfo: info, pokemonSpecies: species)
            view?.setPokemonData(pokemonData: viewModel)
        }
        view?.hideLoading()
    }
    
    func onGetPokemonInfoError(error: String?) {
        view?.showAlert(message: "Details could not be loaded")
        view?.hideLoading()
    }
    
}

//
//  DexPresenter.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 1/2/21.
//

import Foundation

class DexPresenter: DexContractPresenter {
    
    var view: DexContractView?
    var repository: DexRepository?
    var pageNum: Int
    var pageSize: Int
    var offset: Int
    
    init(repository: DexRepository) {
        self.repository = repository
        self.pageNum = 0
        self.pageSize = 10
        self.offset = 0
    }
    
    func getPokedexEntries(dexView: DexContractView) {
        view = dexView
        view?.showLoading()
        offset = pageNum * pageSize
        repository?.getPokedexEntries(dataSource: self, offset: offset, limit: pageSize)
    }
    
}

extension DexPresenter: DexDataSource {
    
    func onGetPokedexEntriesSuccess(pokedexEntries: [PokedexEntryDto]?) {
        if let pokedex = pokedexEntries {
            let viewList = DexPokemonViewModel().getModelViewList(from: pokedex, with: offset)
            view?.setPokedexData(pokedexEntries: viewList)
            pageNum += 1
        } else {
            if pageNum == 0 {
                view?.setPokedexError()
            }
            view?.showAlert(message: "Entries could not be loaded")
        }
        view?.hideLoading()
    }
    
    func onGetPokedexEntriesError(error: String?) {
        if pageNum == 0 {
            view?.setPokedexError()
        }
        view?.showAlert(message: "Entries could not be loaded")
        view?.hideLoading()
    }
        
}

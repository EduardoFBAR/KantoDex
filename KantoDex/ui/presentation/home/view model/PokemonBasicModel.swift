//
//  PokemonBasicModel.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 1/2/21.
//

import Foundation

public struct PokemonBasicModel {
    var id: String?
    var image: String?
    var name: String?
    
    public init(id: String? = nil, image: String? = nil, name: String? = nil) {
        self.id = id
        self.image = image
        self.name = name
    }
}

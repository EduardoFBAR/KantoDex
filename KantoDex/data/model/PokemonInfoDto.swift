//
//  PokemonInfoDto.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 1/2/21.
//

import Foundation

struct PokemonInfoDto {
    var cellImage: String?
    var detailImage: String?
    var id: Int?
    var height: Int?
    var name: String?
    var types: [String]?
    var weight: Int?
    
    public init(cellImage: String? = nil, detailImage: String? = nil, id: Int? = nil, height: Int? = nil, name: String? = nil, types: [String]? = nil, weight: Int? = nil) {
        self.cellImage = cellImage
        self.detailImage = detailImage
        self.id = id
        self.height = height
        self.name = name
        self.types = types
        self.weight = weight
    }
}

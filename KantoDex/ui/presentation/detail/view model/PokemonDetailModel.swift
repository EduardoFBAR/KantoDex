//
//  PokemonDetailModel.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 2/2/21.
//

import Foundation

public struct PokemonDetailModel {
    var captureRate: Int?
    var description: String?
    var habitat: String?
    var happiness: Int?
    var height: Int?
    var id: Int?
    var image: String?
    var isLegendary: Bool?
    var type: String?
    var weight: Int?
    
    public init(captureRate: Int? = nil, description: String? = nil, habitat: String? = nil, happiness: Int? = nil, height: Int? = nil, id: Int? = nil, image: String? = nil, isLegendary: Bool? = nil, type: String? = nil, weight: Int? = nil) {
        self.captureRate = captureRate
        self.description = description
        self.habitat = habitat
        self.happiness = happiness
        self.height = height
        self.id = id
        self.image = image
        self.isLegendary = isLegendary
        self.type = type
        self.weight = weight
    }
}

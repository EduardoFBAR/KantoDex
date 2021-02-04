//
//  PokemonSpeciesDto.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 1/2/21.
//

import Foundation

struct PokemonSpeciesDto {
    var captureRate: Int?
    var description: String?
    var isLegendary: Bool?
    var habitat: String?
    var happiness: Int?
    
    public init(captureRate: Int? = nil, description: String? = nil, isLegendary: Bool? = nil, habitat: String? = nil, happiness: Int? = nil) {
        self.captureRate = captureRate
        self.description = description
        self.isLegendary = isLegendary
        self.habitat = habitat
        self.happiness = happiness
    }
}

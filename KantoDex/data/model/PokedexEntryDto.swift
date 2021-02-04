//
//  PokedexEntryDto.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 2/2/21.
//

import Foundation

struct PokedexEntryDto {
    var name: String?
    
    public init(name: String? = nil) {
        self.name = name
    }
}

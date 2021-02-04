//
//  ApiPath.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 1/2/21.
//

import Foundation
import Alamofire

let URLPath = "https://pokeapi.co/api/v2/"

protocol TargetType {
    var baseURL: String { get }
    var path: String { get }
    var method: String { get }
}

enum API {
    case GetPokedex(String, String)
    case GetSpecies(String)
    case GetPokemonInfo(String)
}

extension API: TargetType {
    
    public var baseURL: String {
        return URLPath
    }
    
    public var path: String {
        switch self {
        case .GetPokedex(let offset, let pageSize):
            let query = "pokemon?"
            let offset = "offset=" + offset
            let limit = "&limit=" + pageSize
            return "\(baseURL)" + query + offset + limit
        case .GetSpecies(let dexId):
            let query = "pokemon-species/"
            return "\(baseURL)" + query + dexId
        case .GetPokemonInfo(let dexId):
            let query = "pokemon/"
            return "\(baseURL)" + query + dexId
        }
    }
    
    public var method: String {
        switch self {
        case .GetPokedex:
            return "GET"
        case .GetSpecies:
            return "GET"
        case .GetPokemonInfo:
            return "GET"
        }
    }
}

//
//  JsonParser.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 1/2/21.
//

import Foundation
import SwiftyJSON

class JsonParser: NSObject {
    
    class var sharedInstance: JsonParser {
        struct Static {
            static let instance: JsonParser = JsonParser()
        }
        return Static.instance
    }
    
    func parseJson(api: API, json: JSON) -> Any? {
        switch api {
        case .GetPokedex(_, _):
            return parsePokedex(json: json)
        case .GetSpecies(_):
            return parsePokemonSpecies(json: json)
        case .GetPokemonInfo(_):
            return parsePokemonInfo(json: json)
        }
    }
    
    private func parsePokedex(json: JSON) -> [PokedexEntryDto] {
        let results = json["results"].arrayValue
        var pokedexEntries: [PokedexEntryDto] = []
        for pokemon in results {
            let pokedexEntry = PokedexEntryDto(name: pokemon["name"].stringValue)
            pokedexEntries.append(pokedexEntry)
        }
        
        return pokedexEntries
    }
    
    private func parsePokemonInfo(json: JSON) -> PokemonInfoDto {
        let height = json["height"].intValue
        let weight = json["weight"].intValue
        let id = json["id"].intValue
        let name = json["name"].stringValue
        let spritesJson = json["sprites"]
        let cellImage = spritesJson["front_default"].stringValue
        let otherJson = spritesJson["other"]
        let artworkJson = otherJson["official-artwork"]
        let detailImage = artworkJson["front_default"].type == Type.string ? artworkJson["front_default"].stringValue : nil
        let typesArray = json["types"].arrayValue
        var types: [String] = []
        for typeJson in typesArray {
            let type = typeJson["type"]
            types.append(type["name"].stringValue)
        }
        
        let pokemonInfoDto = PokemonInfoDto(cellImage: cellImage, detailImage: detailImage, id: id, height: height, name: name, types: types, weight: weight)
        return pokemonInfoDto
    }
    
    private func parsePokemonSpecies(json: JSON) -> PokemonSpeciesDto {
        let happiness = json["base_happiness"].intValue
        let captureRate = json["capture_rate"].intValue
        let habitatJson = json["habitat"]
        let habitat = habitatJson["name"].stringValue
        let isLegendary = json ["is_legendary"].boolValue
        let descriptionsArray = json["flavor_text_entries"].arrayValue
        let descriptionJson = descriptionsArray[0]
        let description = descriptionJson["flavor_text"].stringValue
        
        let pokemonSpeciesDto = PokemonSpeciesDto(captureRate: captureRate, description: description, isLegendary: isLegendary, habitat: habitat, happiness: happiness)
        return pokemonSpeciesDto
    }
    
}

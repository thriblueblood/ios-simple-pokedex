//
//  PokemonHandler.swift
//  Pokedex
//
//  Created by T Thirayut on 15/3/2567 BE.
//

import Foundation
import Alamofire

class PokemonHandler{
    func fetchAllPokemon(nextList : Int ,completionHandler: @escaping ([Pokemon]) -> Void){
        let path = "https://pokeapi.co/api/v2/pokemon?offset=\(nextList)&limit=20"
        let request = AF.request(path, method: .get, encoding: URLEncoding.default)
        request.validate(statusCode: 200..<300).responseJSON{ (response) in
            switch response.result{
            case .success(let data): do{
                if let json = data as? [String: AnyObject]{
                    let postArray = json["results"] as! [AnyObject]
                    var pokemonList : [Pokemon] = []
                    
                    for pokemonNumber in 0..<postArray.count{
                        let id = pokemonNumber+nextList+1
                        let name = postArray[pokemonNumber]["name"] as? String
                        let imageURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokemonNumber+nextList+1).png"
                        
                        let pokemon = Pokemon(id: id, name: name, imageURL: imageURL)
                        pokemonList.append(pokemon)
                    }
                    completionHandler(pokemonList)
                }
            }
            case .failure(_): do{
                completionHandler([])
            }
            }
        }
    }
}

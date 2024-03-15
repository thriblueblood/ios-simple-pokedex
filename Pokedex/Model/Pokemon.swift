//
//  Pokemon.swift
//  Pokedex
//
//  Created by T Thirayut on 15/3/2567 BE.
//

import Foundation

struct Pokemon {
    var id: Int
    var name: String?
    var imageURL: String
    
    init(id: Int, name: String?, imageURL: String) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
    }
}

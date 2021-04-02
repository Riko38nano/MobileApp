//
//  Game.swift
//  MobileApp
//
//  Created by etud on 11/03/2021.
//
import SwiftUI


class Game: Codable, Identifiable{
    var _id: String
    var editorId: String
    var name: String
    var min_yearold: Int
    var category: String
    var duration: Int
    var nb_player_min: Int
    var nb_player_max: Int
    var game_notice: String
    var __v: Int
}
class GameEditor: Codable, Identifiable{
    var contacts: [String]
    var _id: String
    var name: String
    var isEditor: Bool
    var isExhibitor: Bool
    var isPotential: Bool
}

class GameExposant: Codable, Identifiable{
    var contacts: [String]
    var _id: String
    var name: String
    var isEditor: Bool
    var isExhibitor: Bool
    var isPotential: Bool
}


class GameView: Codable, Identifiable{
    var game: Game
    var state: String
    var zone: String
    var editor: GameEditor
    var exhibitor: GameExposant
    var proto: Bool
}

        "state": "apporté par exposant",
        "zone": "Pas attribué",
        "editor": {
            "contacts": [
                "alexis@auroragames.fr",
                "formieres@linkkipeli.fr"
            ],
            "_id": "6066c34be8ee772b20d3bcb2",
            "tmpIdEditor": "218",
            "name": "Aurora",
            "isEditor": true,
            "isExhibitor": true,
            "isPotential": true
        },
        "exhibitor": {
            "contacts": [
                "galoisnicolas@gmail.com",
                ""
            ],
            "_id": "6066c34be8ee772b20d3bcaa",
            "tmpIdEditor": "205",
            "name": "A.L.F.",
            "isEditor": false,
            "isExhibitor": true,
            "isPotential": true
        },
        "proto": true
    }

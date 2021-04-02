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

class GameView: Codable, Identifiable{
    var game: Game
    var state: String
    var zone: String
    var editor: Editor
    var exhibitor: Exposant
    var proto: Bool
}

//
//  Game.swift
//  MobileApp
//
//  Created by etud on 11/03/2021.
//
import SwiftUI

class Game: Codable, Identifiable{
    var _id: String
    var name: String
    var min_yearold: Int
    var category: String
    var duration: Int
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

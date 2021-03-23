//
//  Game.swift
//  MobileApp
//
//  Created by etud on 11/03/2021.
//

import Foundation

class Game : Identifiable, Encodable{
    var id =  UUID()
    private(set) var name: String
    private(set) var category: String
    private(set) var min_yearold: Int
    private(set) var duration: Int
    private(set) var exposantEditor: Int
    private(set) var proto: Bool
    
    init(name: String, category: String, min_yearold: Int, duration: Int, exposantEditor: Int, proto: Bool) {
        self.name = name
        self.category = category
        self.min_yearold = min_yearold
        self.duration = duration
        self.exposantEditor = exposantEditor
        self.proto = proto
    }
}

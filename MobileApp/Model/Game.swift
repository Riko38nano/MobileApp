//
//  Game.swift
//  MobileApp
//
//  Created by etud on 11/03/2021.
//

import Foundation

class Game : Identifiable, Encodable{
    private(set) var id: Int
    private(set) var name: String
    private(set) var category: String
    private(set) var min_yearold: Int
    private(set) var duration: Int
    private(set) var editor: Editor
    private(set) var proto: Bool
    
    init(id: Int, name: String, min_yearold: Int, duration: Int, editor: Editor, proto: Bool) {
        self.id = id
        self.name = name
        self.min_yearold = min_yearold
        self.duration = duration
        self.editor = editor
        self.proto = proto
    }
}

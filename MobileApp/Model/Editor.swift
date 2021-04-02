//
//  Editor.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 31/03/2021.
//

import SwiftUI

class Editor: Codable, Identifiable {
    var contacts: [String]
    var _id: String
    var tmpIdEditor: String
    var name : String
    var isEditor: Bool
    var isExhibitor: Bool
    var isPotential: Bool
}

class EditorView: Codable, Identifiable{
    var editor: Editor
    var games: [Game]
}
    

//
//  Editor.swift
//  MobileApp
//
//  Created by etud on 11/03/2021.
//

import SwiftUI

class Exposant: Codable, Identifiable {
    var contacts: [String]
    var games: [String]
    var _id: String
    var name : String
    var isEditor: Bool
    var isExhibitor: Bool
    var isPotential: Bool
}

//
//  Zone.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 02/04/2021.
//

import SwiftUI

class ZoneGame: Codable, Identifiable{
    var _id: String
    var game: String
}

class Zone: Codable, Identifiable{
    var _id: String
    var festival: String
    var label: String
    var sm_capacity: Int
    var games: [ZoneGame]
}


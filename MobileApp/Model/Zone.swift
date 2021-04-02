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
    var __v: Int
}

//{
//       "_id": "6065fd20953ab104b87c76a8",
//       "festival": "605751c85e174b15281f1a41",
//       "label": "C1",
//       "sm_capacity": 3,
//       "games": [
//           {
//               "_id": "6066379d15081b3c10e45b3c",
//               "game": "605dd2e324f9ca3e946ff55b"
//           },
//           {
//               "_id": "6066379d15081b3c10e45b3d",
//               "game": "6064ba2b35eb2124b8caf355"
//           }
//       ],
//       "__v": 0
//   }

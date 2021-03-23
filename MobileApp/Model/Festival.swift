//
//  Festival.swift
//  MobileApp
//
//  Created by etud on 23/03/2021.
//

import Foundation

struct Festival {
    var id = UUID()
    var name : String
    var content : String
    var adresse : String
    var active : Bool
    
    init(name: String, content: String, adresse: String, active: Bool){
        self.name = name
        self.content = content
        self.adresse = adresse
        self.active = active
    }
}

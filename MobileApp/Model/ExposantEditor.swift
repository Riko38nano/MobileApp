//
//  Editor.swift
//  MobileApp
//
//  Created by etud on 11/03/2021.
//

import Foundation

class ExposantEditor: Identifiable, Encodable {
    private(set) var id: Int
    private(set) var name: String
    private(set) var address: String
    private(set) var contacts: [Contact]
    
    init(id: Int, name: String, address: String, contacts: [Contact]) {
        self.id = id
        self.name = name
        self.address = address
        self.contacts = contacts
    }
}

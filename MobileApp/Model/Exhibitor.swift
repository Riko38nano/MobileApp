//
//  Exhibitor.swift
//  MobileApp
//
//  Created by etud on 11/03/2021.
//

import Foundation

class Exhibitor {
    private(set) var lastName: String
    private(set) var firstName: String
    private(set) var phoneNumber: String?
    private(set) var email: String
    
    init(lastName: String, firstName: String, phoneNumber: String?, email: String){
        self.lastName = lastName
        self.firstName = firstName
        self.phoneNumber = phoneNumber
        self.email = email
    }
}

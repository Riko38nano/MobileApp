//
//  ExposantHelper.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 02/04/2021.
//

import SwiftUI

class ExposantHelper{
    static func getNbExposant() -> Int{
        var exposants = ExposantViewModel().exposants
        return exposants.count
    }
    
    static func getExposantByid(idExposant: String) -> Exposant?{
        var exposants = ExposantViewModel().exposants
        var exp : Exposant? = nil
        for exposant in exposants{
            if exposant._id == idExposant{
                exp = exposant
                break
            }
            
        }
    
        return exp
    }
}

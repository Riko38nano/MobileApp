//
//  GameViewModel.swift
//  MobileApp
//
//  Created by etud on 11/03/2021.
//

import Foundation

class GameViewModel: Identifiable {
    private(set) var model: Game
    
    init(_ model: Game){
        self.model = model
    }
    
    var id : Int{
        return model.id
    }
    
    var name : String{
        return model.name
    }
    
    var category : String{
        return model.category
    }
    
    var min_yearold : Int{
        return model.min_yearold
    }
    
    var duration : Int{
        return model.duration
    }
    
    var editor : Editor{
        return model.editor
    }
    
    var proto : Bool{
        return model.proto
    }
}

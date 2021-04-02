//
//  GameHelper.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 02/04/2021.
//

import SwiftUI

class GameHelper{
    static func getGamesByEditorId(idEditor: String) -> [GameView]{
        var gamesView = GameViewModel().gamesView
        var gamesViewBack : [GameView] = []
        for gameView in gamesView{
            if(gameView.editor._id == idEditor){
                gamesViewBack.append(gameView)
            }
        }
        return gamesViewBack
    }
    
    
    static func getGamesByExposantId(idExposant: String) -> [GameView]{
        var gamesView = GameViewModel().gamesView
        var gamesViewBack : [GameView] = []
        for gameView in gamesView{
            if(gameView.exhibitor._id == idExposant){
                gamesViewBack.append(gameView)
            }
        }
        return gamesViewBack
    }
    
    static func nbJeux() -> Int{
        var gamesView = GameViewModel().gamesView
        return gamesView.count
    }
}



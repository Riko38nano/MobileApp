//
//  GameViewModel.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 02/04/2021.
//

import SwiftUI
import Combine

class GameViewModel: ObservableObject, Identifiable {
    @Published var gamesView: [GameView] = []
    
    init() {
        getGames()
    }
    
    func setHTTPGames( gamesView: [GameView]){
        self.gamesView = gamesView
    }
    func getGames() {
        Api().getGames(completion: setHTTPGames)
    }
}

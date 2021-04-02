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
    @Published var nb: Int = 0
    
    init() {
        getGames()
    }
    
    func setHTTPGames( gamesView: [GameView]){
        self.gamesView = gamesView
        self.nb = gamesView.count
    }
    func getGames() {
        Api().getGames(completion: setHTTPGames)
    }

}

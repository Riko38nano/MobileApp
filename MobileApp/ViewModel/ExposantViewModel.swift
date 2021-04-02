//
//  ExposantViewModel.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 02/04/2021.
//

import SwiftUI
import Combine

class ExposantViewModel: ObservableObject, Identifiable {
    @Published var exposants: [Exposant] = []
    @Published var nb: Int = 0
    
    init() {
        getExposants()
    }
    
    func setHTTPExposants( exposants: [Exposant]){
        self.exposants = exposants
        self.nb = exposants.count
    }
    func getExposants() {
        Api().getExposants(completion: setHTTPExposants)
    }
    
    static func getGamesByExposantId(idExposant: String) -> [Game]{
        var gamesViewModel = GameViewModel()
        var games: [Game] = []
        for gameView in gamesViewModel.gamesView{
            if(gameView.exhibitor._id == idExposant){
                games.append(gameView.game)
            }
        }
        return games
    }
    
}

//
//  GameViewModel.swift
//  MobileApp
//
//  Created by etud on 11/03/2021.
//

import SwiftUI
import Combine

class DataStore: ObservableObject {
    @Published var posts: Festival? = nil
    
    init() {
        getFestival()
    }
    
    func setHTTPFestival( festival : Festival){
        self.posts = festival
    }
    func getFestival() {
        Api().getFestival(toto: setHTTPFestival)
    }
}

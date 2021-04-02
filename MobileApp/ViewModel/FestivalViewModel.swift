//
//  GameViewModel.swift
//  MobileApp
//
//  Created by etud on 11/03/2021.
//

import SwiftUI
import Combine

class FestivalViewModel: ObservableObject {
    @Published var festival: Festival? = nil
    
    init() {
        getFestival()
    }
    
    func setHTTPFestival( festival : Festival){
        self.festival = festival
    }
    func getFestival() {
        Api().getFestival(toto: setHTTPFestival)
    }
}

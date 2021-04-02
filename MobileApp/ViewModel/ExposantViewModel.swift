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
    
    init() {
        getExposants()
    }
    
    func setHTTPExposants( exposants: [Exposant]){
        self.exposants = exposants
    }
    func getExposants() {
        Api().getExposants(completion: setHTTPExposants)
    }
}

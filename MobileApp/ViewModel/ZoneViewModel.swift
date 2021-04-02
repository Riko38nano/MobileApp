//
//  ZoneViewModel.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 02/04/2021.
//

import SwiftUI

import SwiftUI
import Combine

class ZoneViewModel: ObservableObject, Identifiable {
    @Published var zones: [Zone] = []
    
    init() {
        getZones()
    }
    
    func setHTTPZones( zones: [Zone]){
        self.zones = zones
    }
    func getZones() {
        Api().getZones(completion: setHTTPZones)
    }
}

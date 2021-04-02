//
//  EditorViewModel.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 02/04/2021.
//

import SwiftUI
import Combine

class EditorViewModel: ObservableObject, Identifiable {
    @Published var editors: [Editor] = []
    @Published var nb: Int = 0
    
    init() {
        getEditors()
    }
    
    func setHTTPEditors( editors: [Editor]){
        self.editors = editors
        self.nb = editors.count
    }
    func getEditors() {
        Api().getEditors(completion: setHTTPEditors)
    }
}

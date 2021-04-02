//
//  EditorViewModel.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 02/04/2021.
//

import SwiftUI
import Combine

class EditorViewModel: ObservableObject, Identifiable {
    @Published var editors: [EditorView] = []
    
//    init() {
//        getEditors()
//    }
//    
//    func setHTTPEditors( editors: [EditorView]){
//        self.editors = editors
//    }
//    func getEditors() {
//        Api().getEditors(completion: setHTTPEditors)
//    }
}

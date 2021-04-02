//
//  ContentView.swift
//  MobileApp
//
//  Created by etud on 11/03/2021.
//

import SwiftUI
import CoreData
import Foundation

struct ContentView: View{

    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .page1:
            HomeView()
        case .page2:
            ZoneList()
                .transition(.scale)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}



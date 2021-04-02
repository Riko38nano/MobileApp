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

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}




//struct CardOnHome: View {
//    @Binding var showGames: Bool
//    @Binding var showEditors: Bool
//    @Binding var showExposants: Bool
//    var body: some View {
//        HStack(spacing: 10) {
//            BlockOnCard(title: "Jeux", nb: 5, imageName: "logEditor").onTapGesture {
//                self.showGames.toggle()
//            }
//            BlockOnCard(title: "Exposant",nb: 5, imageName: "logEditor").onTapGesture {
//                self.showExposants.toggle()
//            }
//            BlockOnCard(title: "Editor", nb: 5,imageName: "Logo1").onTapGesture {
//                self.showEditors.toggle()
//            }
//        }
//    }
//}

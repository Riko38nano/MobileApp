//
//  MobileAppApp.swift
//  MobileApp
//
//  Created by etud on 11/03/2021.
//

import SwiftUI

@main
struct MobileApp: App {
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewRouter())
        }
    }
}

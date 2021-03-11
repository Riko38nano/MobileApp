//
//  MobileAppApp.swift
//  MobileApp
//
//  Created by etud on 11/03/2021.
//

import SwiftUI

@main
struct MobileApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

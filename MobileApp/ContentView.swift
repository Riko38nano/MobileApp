//
//  ContentView.swift
//  MobileApp
//
//  Created by etud on 11/03/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    /// which tab appear selected
    @State private var tabSelected  = 0
    
    var body: some View {
        TabView(selection: $tabSelected){
            HomeView()
                .tabItem
                {
                    Label("Accueil", systemImage: "list.dash")
                }.tag(0)
            Text("Vue de liste games")
                .tabItem{
                    Label("Jeux", systemImage: "rectangle.and.text.magnifyingglass")
                }.tag(1)
            EditorListView()
                .tabItem{
                    Label("Éditeurs", systemImage: "rectangle.and.text.magnifyingglass")
                }.tag(2)
            ExhibitorListView()
                .tabItem{
                    Label("Exposant", systemImage: "list.dash")
                }.tag(3)
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
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

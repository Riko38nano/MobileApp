//
//  ListGamesView.swift
//  MobileApp
//
//  Created by etud on 11/03/2021.
//

import SwiftUI

struct ListGamesView: View {
    var listGames : [Game]
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    List{
                        ForEach(listGames){ game in
                            NavigationLink(destination: GameView){
                                ListRow(game: game)
                            }
                        }
                    }
                    if listGames.count == 0{
                        VStack{
                            Spacer()
                            Text("Pas de Jeux disponibles")
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}
    
struct ListGamesView_Previews: PreviewProvider {
    static var previews: some View {
        let contact : Contact = Contact(lastName: "", firstName: "", phoneNumber: "", email: "")
        let editor: Editor = Editor(id: 1, name: "Nico", address: "5", contacts: [contact])
        let games: [Game] = [Game(id: 0, name: "sa", min_yearold: 3, duration: 3, editor: editor, proto: true), Game(id: 1, name: "as", min_yearold: 3, duration: 3, editor: editor, proto: false)]
        
        ListGamesView(listGames: games)
    }
}

struct ListRow : View{
    let game : GameViewModel
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                if let name = game.name { Text(name).font(.title2) }
                Text(game.name)
                    .font(.headline)
                Text(game.category)
            }
        }
    }
}

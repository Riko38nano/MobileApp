//
//  EditorDetail.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 30/03/2021.
//

import SwiftUI

struct EditorDetail: View {
    @State var games: [GameView] = []
    var editor: Editor
    
    var body: some View {
        
        VStack(spacing: 40){
            VStack{
                Text("Editeur: \(editor.name) ").modifier(FontModifier(style: .title))
            }
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 20) {
                        ForEach(self.games) { gameView in
                            GeometryReader { geometry in
                                //GameCard(gameView: gameView)
                                GameCard(gameView: gameView)
                                    .rotation3DEffect(Angle(degrees:
                                        Double(geometry.frame(in: .global).minX - 30) / -20
                                    ), axis: (x: 0, y: 10, z: 0))
                            }
                            .frame(width: 150, height: 275)
                        }
                    }
                    .padding(30)
                }
                VStack{
                    HStack {
                        Text("Nombre de jeux")
                        Spacer()
                        Text(String(self.games.count))
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    
                }.frame(width: 300, height: 120)
            }
        }
    }
}

struct EditorDetail_Previews: PreviewProvider {
    static var previews: some View {
        //EditorDetail()
        Text("dkjfvnq")
    }
}

//
//  ExhibitorDetail.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 30/03/2021.
//

import SwiftUI

struct ExhibitorDetail: View {
 
    var exposant: Exposant
    @State var games: [GameView] = []
    var body: some View {
        
        VStack(spacing: 40){
            VStack{
                Text("Exposant: \(exposant.name) ").modifier(FontModifier(style: .title))
            }
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 20) {
                        ForEach(games) { gameView in
                            GeometryReader { geometry in
                                //GameCard(gameView: gameView)
                                GameCard()
                                    .rotation3DEffect(Angle(degrees:
                                        Double(geometry.frame(in: .global).minX - 30) / -20
                                    ), axis: (x: 0, y: 10, z: 0))
                            }
                            .frame(width: 150, height: 275)
                        }
                    }
                    .padding(30)
                }.onAppear{
                    self.games = GameHelper.getGamesByExposantId(idExposant: exposant._id)
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

struct ExhibitorDetail_Previews: PreviewProvider {
    static var previews: some View {
        //ExhibitorDetail()
        Text("djgh,cbv")
    }
}

//
//  ExhibitorDetail.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 30/03/2021.
//

import SwiftUI

struct ExhibitorDetail: View {
 
    var exposant: Exposant
    @ObservedObject var gameViewModel = GameViewModel()
    
    var body: some View {
        
        VStack(spacing: 40){
            VStack{
                Text("Exposant: \(exposant.name) ").modifier(FontModifier(style: .title))
            }
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 20) {
                        ForEach(gameViewModel.getGamesByExposantId(idExposant: self.exposant._id)) { game in
                            
                            GeometryReader { geometry in
                                GameCard(game: game)
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
                        Text(verbatim: String(gameViewModel.getGamesByExposantId(idExposant: self.exposant._id).count))
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


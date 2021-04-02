//
//  GameCard.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 30/03/2021.
//

import SwiftUI

struct GameCard: View {
    //var gameView: GameView
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image(systemName: "gamecontroller").resizable().frame(width: 16, height: 20).foregroundColor(.red)
                Text("gameView.game.min_yearold ans").font(.footnote).foregroundColor(.secondary)
            }
            Image("gameIcon").resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100)
            Text("gameView.game.name").font(.headline)
            Text("gameView.game.category").foregroundColor(.secondary).font(.subheadline).padding(.bottom, 12)
            Text("String(gameView.game.duration)").font(.title)
        }.frame(width: 160, height: 250).background(Color.secondary.opacity(0.3)).cornerRadius(12)
    }
}

struct GameCard_Previews: PreviewProvider {
    static var previews: some View {
        GameCard()
        //Text("shdfgb")
    }
}

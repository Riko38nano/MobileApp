//
//  GameCard.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 30/03/2021.
//

import SwiftUI

struct GameCard: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image(systemName: "flame.fill").resizable().frame(width: 16, height: 20).foregroundColor(.red)
                Text("Very Hot").font(.footnote).foregroundColor(.secondary)
            }
            Image("logEditor").resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100)
            Text("Classic").font(.headline)
            Text("Burgur").foregroundColor(.secondary).font(.subheadline).padding(.bottom, 12)
            Text("$17.99").font(.title)
        }.frame(width: 160, height: 250).background(Color.secondary.opacity(0.3)).cornerRadius(12)
    }
}

struct GameCard_Previews: PreviewProvider {
    static var previews: some View {
        GameCard()
    }
}

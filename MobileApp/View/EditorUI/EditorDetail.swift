//
//  EditorDetail.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 30/03/2021.
//

import SwiftUI

struct EditorDetail: View {

    var editor: Editor
    @ObservedObject var gameViewModel = GameViewModel()
    
    var body: some View {
        
        VStack(spacing: 40){
            VStack{
                Text("Editor: \(editor.name) ").modifier(FontModifier(style: .title))
            }
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 20) {
                        ForEach(gameViewModel.getGamesByEditorId(idEditor: self.editor._id)) { game in
                            
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
                        Text(verbatim: String(gameViewModel.getGamesByEditorId(idEditor: self.editor._id).count))
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

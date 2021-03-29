//
//  EditorDetail.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 30/03/2021.
//

import SwiftUI

struct EditorDetail: View {
    let persons = [Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Leo", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info")]
    var body: some View {
        
        VStack(spacing: 40){
            VStack{
                Text("Editeur: Nom de l'editeur").modifier(FontModifier(style: .title))
            }
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 20) {
                        ForEach(persons) { item in
                            GeometryReader { geometry in
                                GameCard()
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
                        Text("10")
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack {
                        Text("Low")
                        Spacer()
                        Text("2")
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack {
                        Text("Premium")
                        Spacer()
                        Text("7")
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack {
                        Text("Standart")
                        Spacer()
                        Text("1")
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
        EditorDetail()
    }
}

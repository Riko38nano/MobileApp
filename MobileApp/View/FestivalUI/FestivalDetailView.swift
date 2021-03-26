//
//  FestivalDetailView.swift
//  MobileApp
//
//  Created by etud on 23/03/2021.
//

import SwiftUI

struct FestivalDetailView: View {
    @State var show: Bool
    var body: some View {
        
        ScrollView(){
            VStack(){
                HStack(){
                    Image("logo_complet")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    Spacer()
                    Text("Edition 2020").bold().modifier(FontModifier(style: .title))
                }.padding()
                HStack(){
                    ScrollView(.horizontal, showsIndicators: false) {
                        CardOnHome(show: $show)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                    }
                }
                Image("battle")
                    .resizable()
                    .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                
                VStack(spacing: 10.0){
                    Text("L'adresse").bold().modifier(FontModifier(style: .title))
                    Text("98 rue jean françois breton")
                    Link(destination: URL(string: "https://www.apple.com")!) {
                        Text("Voir l'adresse")
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .padding(.top, 10)
                    }
                }.padding(.top, 10)

                VStack (alignment: .leading, spacing: 20) {
                    HStack {
                        Image("logEditor").resizable().frame(width: 80, height: 80).cornerRadius(20)
                        Spacer()
                        Image(systemName: "arrowtriangle.right.fill").resizable()
                        .frame(width: 10, height: 10).foregroundColor(.gray)
                        .padding(.all, 24).background(Color.white).clipShape(Circle())
                    }
                    Text("Jeu par Zone").font(.title).fontWeight(.heavy)
                    HStack{
                        VStack(alignment: .center, spacing: 4.0) {
                            Text("A l'entrée").bold().modifier(FontModifier(style: .subheadline))
                            Text(String(15)).modifier(FontModifier(style: .caption))
                            }
                        .modifier(FontModifier())
                        VStack(alignment: .center, spacing: 4.0) {
                            Text("Premium").bold().modifier(FontModifier(style: .subheadline))
                            Text(String(15)).modifier(FontModifier(style: .caption))
                            }
                        .modifier(FontModifier())
                        VStack(alignment: .center, spacing: 4.0) {
                            Text("A l'entrée").bold().modifier(FontModifier(style: .subheadline))
                            Text(String(15)).modifier(FontModifier(style: .caption))
                            }
                        .modifier(FontModifier())
                    }
                }.padding(.horizontal, 24).frame(height: 230).background(Color.blue.opacity(0.2)).cornerRadius(36)
            }
        }
    }
}

struct FestivalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FestivalDetailView(show: true)
    }
}

struct BlockOnCard: View {
    var title: String
    var nb: Int
    var imageName: String
    var body: some View {
        HStack(spacing: 12.0) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            VStack(alignment: .center, spacing: 4.0) {
                Text(title).bold().modifier(FontModifier(style: .subheadline))
                Text(String(nb)).modifier(FontModifier(style: .caption))
            }
            .modifier(FontModifier())
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(20)
        .modifier(ShadowModifier())

    }
}

struct CardOnHome: View {
    @Binding var show: Bool
    var body: some View {
        
        HStack(spacing: 10) {
            if(show){
            BlockOnCard(title: "Jeux", nb: 5, imageName: "logEditor").onTapGesture {
                self.show.toggle()
            }
        }
            BlockOnCard(title: "Exposant",nb: 5, imageName: "logEditor").onTapGesture {
                self.show.toggle()
        }
            BlockOnCard(title: "Editor", nb: 5,imageName: "Logo1")
        }
    }
}

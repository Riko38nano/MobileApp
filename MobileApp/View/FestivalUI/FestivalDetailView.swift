//
//  FestivalDetailView.swift
//  MobileApp
//
//  Created by etud on 23/03/2021.
//

import SwiftUI

struct FestivalDetailView: View {
    var body: some View {
        VStack(){
            HStack(){
                Image("logo_complet")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                Spacer()
                Text("Edition 2020").bold().modifier(FontModifier(style: .title))
            }
            HStack(){
                ScrollView(.horizontal, showsIndicators: false) {
                    CardOnHome()
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                }
            }
            Image("battle")
                .resizable()
                .frame(width: CGFloat(screen.height/2), height: CGFloat(screen.width/2))
            
            Spacer()
            Spacer()
        }
    }
}

struct FestivalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FestivalDetailView()
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
    var body: some View {
        HStack(spacing: 10) {
            BlockOnCard(title: "Jeux", nb: 5, imageName: "logEditor")
            BlockOnCard(title: "Exposant",nb: 5, imageName: "logEditor")
            BlockOnCard(title: "Editor", nb: 5,imageName: "Logo1")
        }
    }
}

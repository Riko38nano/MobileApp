//
//  HomeView.swift
//  MobileApp
//
//  Created by etud on 11/03/2021.
//

import SwiftUI
import Foundation

struct HomeView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    //@EnvironmentObject var viewRouter: ViewRouter
    /// which tab appear selected
    @State var nbJeux = GameHelper.nbJeux()
    @State var nbEditor = EditorHelper.getNbEditor()
    @State var nbExposant = ExposantHelper.getNbExposant()
    @ObservedObject var festivalViewModel = FestivalViewModel()
    @State private var tabSelected  = 0
    var body: some View {
        TabView(selection: $tabSelected){
            ScrollView(){
                VStack(){
                    HStack(){
                        Image("logo_complet")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                        Spacer()
                        if let festival = festivalViewModel.festival {
                            VStack{
                                Text("Edition: \(String(festival.year)) ").bold().modifier(FontModifier(style: .title))
                                Text(festival.name)
                            }
                        }
                    }.padding()
                    HStack(){
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                BlockOnCard(title: "Jeux", nb: self.nbJeux, icone: "gamecontroller").onTapGesture {
                                    self.tabSelected = 1
                                }
                                BlockOnCard(title: "Exposant",nb: self.nbExposant, icone: "person").onTapGesture {
                                    self.tabSelected = 3
                                }
                                BlockOnCard(title: "Editor", nb: self.nbEditor,icone: "pencil.and.ellipsis.rectangle").onTapGesture {
                                    self.tabSelected = 2
                                }
                            }
                                .padding(.horizontal, 20)
                                .padding(.bottom, 20)
                        }
                    }
                    Image("battle")
                        .resizable()
                        .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                    
                    VStack(spacing: 10.0){
                        Text("L'adresse").bold().modifier(FontModifier(style: .title))
                        Text("Le Corum")
                        Link(destination: URL(string: "https://www.google.com/maps/dir//corum+montpellier/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x12b6af0b94e490fd:0x3cf7e3f07d11afd3?sa=X&ved=2ahUKEwjP5ovExtzvAhWhA2MBHQ1JB5QQ9RcwHnoECDIQBA")!) {
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
                            Image(systemName:"skew")
                                .resizable().frame(width: 80, height: 80).cornerRadius(20)
                            Spacer()
                            Image(systemName: "arrowtriangle.right.fill").resizable()
                            .frame(width: 10, height: 10).foregroundColor(.gray)
                            .padding(.all, 24).background(Color.white).clipShape(Circle())
                                .onTapGesture {
                                    viewRouter.currentPage = .page2
                                }
                        }
                        Text("Jeu par Zone").font(.title).fontWeight(.heavy)
                    }.padding(.horizontal, 24).frame(height: 230).background(Color.blue.opacity(0.2)).cornerRadius(36)
                }
            }
                .tabItem
                {
                    Label("Accueil", systemImage: "list.dash")
                }.tag(0)
            GameListe()
                .tabItem{
                    Label("Jeux", systemImage: "rectangle.and.text.magnifyingglass")
                }.tag(1)
            EditorListView()
                .tabItem{
                    Label("Éditeurs", systemImage: "rectangle.and.text.magnifyingglass")
                }.tag(2)
            ExhibitorListView()
                .tabItem{
                    Label("Exposant", systemImage: "list.dash")
                }.tag(3)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ViewRouter())
    }
}

struct BlockOnCard: View {
    var title: String
    var nb: Int
    var icone: String
    var body: some View {
        HStack(spacing: 12.0) {
            Image(systemName: icone)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            VStack(alignment: .center, spacing: 4.0) {
                Text(title).bold().modifier(FontModifier(style: .subheadline))
                Text(String(nb)).modifier(FontModifier(style: .caption)).foregroundColor(.green)
            }
            .modifier(FontModifier())
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(20)
        .modifier(ShadowModifier())

    }
}

//
//  GameListe.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 26/03/2021.
//


import SwiftUI

struct Person: Identifiable{
    var id = UUID()
    let imageName = "logEditor"
    var name, etude:String
}

struct GameListe: View {
    @State var searchText = ""
    @State var isSearching = false
    
    @ObservedObject var gameViewModel = GameViewModel()
    
    private func filterSearch(gamesView: GameView) -> Bool{
        var ret = false
        if gamesView.game.name.lowercased().contains(searchText.lowercased()) || searchText.isEmpty {
            ret = true
        }
        return ret
    }
    
    var body: some View {
        NavigationView {
            if #available(iOS 14.0, *) {
                ScrollView {
                    SearchBar(searchText: $searchText, isSearching: $isSearching)
                    LazyVGrid(columns: [
                        GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .top),
                        GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .top),
                        GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16),
                    ], alignment: .leading, spacing: 16, content: {
                        ForEach(self.gameViewModel.gamesView.filter(filterSearch)){ gameView in
                            NavigationLink(destination: GameDetail(gameView: gameView))
                            {
                                HStack {
                                    //Text("fsghdshfdhs")
                                    GameRow(gamesView: gameView)
                                    Spacer()
                                }.padding()
                               
                            }.onAppear{
                                print("juste ici")
                                
                                print(self.gameViewModel.getGamesByExposantId(idExposant: "6066c34be8ee772b20d3bd00").count)
                                
                            }
                        }
                    }).padding(.horizontal, 12)
                }.navigationTitle("Jeux")
                
            } else {
                // Fallback on earlier versions
            }
        }
        
    }
}

struct GameListe_Previews: PreviewProvider {
    static var previews: some View {
        GameListe()
    }
}


struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack {
            HStack {
                TextField("Search terms here", text: $searchText)
                    .padding(.leading, 24)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(6)
            .padding(.horizontal)
            .onTapGesture(perform: {
                isSearching = true
            })
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    
                    if isSearching {
                        Button(action: { searchText = "" }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        })
                        
                    }
                    
                }.padding(.horizontal, 32)
                .foregroundColor(.gray)
            ).transition(.move(edge: .trailing))
            .animation(.spring())
            
            if isSearching {
                Button(action: {
                    isSearching = false
                    searchText = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                }, label: {
                    Text("Cancel")
                        .padding(.trailing)
                        .padding(.leading, 0)
                })
                .transition(.move(edge: .trailing))
                .animation(.spring())
            }
            
        }
    }
}

struct GameRow: View {
    let gamesView: GameView
    
    var body: some View {
    
        VStack(alignment: .leading, spacing: 4) {
            
            Image("gameIcon")
                .resizable()
                .scaledToFit()
                .cornerRadius(22)
            
            Text(gamesView.game.name)
                .font(.system(size: 10, weight: .semibold))
                .padding(.top, 4)
            Text(gamesView.game.category)
                .font(.system(size: 9, weight: .regular))
            Text("\(gamesView.game.duration) min")
                .font(.system(size: 9, weight: .regular))
                .foregroundColor(.gray)
            
            Spacer()
        }
    }
}


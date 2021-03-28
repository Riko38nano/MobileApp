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
    
    let persons = [Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Leo", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info")]
    
    private func filterSearch(person: Person) -> Bool{
        var ret = false
        if person.name.contains(searchText) || searchText.isEmpty {
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
                        ForEach(self.persons.filter(filterSearch)){ person in
                            NavigationLink(destination: GameDetail())
                            {
                                HStack {
                                    GameRow(user: person)
                                    Spacer()
                                }.padding()
                               
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
    let user: Person
    
    var body: some View {
    
        VStack(alignment: .leading, spacing: 4) {
            
            Image(user.imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(22)
            
            Text(user.name)
                .font(.system(size: 10, weight: .semibold))
                .padding(.top, 4)
            Text(user.etude)
                .font(.system(size: 9, weight: .regular))
            Text(user.name)
                .font(.system(size: 9, weight: .regular))
                .foregroundColor(.gray)
            
            Spacer()
        }
    }
}


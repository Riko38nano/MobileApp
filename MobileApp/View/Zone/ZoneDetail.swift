//
//  ZoneDetail.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 30/03/2021.
//

import SwiftUI

struct ZoneDetail: View {
    @State var searchText = ""
    @State var isSearching = false
    var zone: Zone
    
    let persons = [Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Leo", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info")]
    
    private func filterSearch(person: Person) -> Bool{
        var ret = false
        if person.name.contains(searchText) || searchText.isEmpty {
            ret = true
        }
        return ret
    }
    
    private let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationView {
            if #available(iOS 14.0, *) {
                ScrollView {
                    HStack(){
                        Text(zone.label)
                    }
                    ZoneSearchBar(searchText: $searchText, isSearching: $isSearching)
                    LazyVGrid(columns: gridItems, content: {
                        ForEach(self.persons.filter(filterSearch)){ person in
                            NavigationLink( destination: Text("bds,cn"))//destination: GameDetail())
                            {
                                HStack {
                                    //GameCard()
                                    Spacer()
                                }.padding()
                               
                            }
                        }
                    })
                }.navigationTitle("Jeux")
                
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

struct ZoneDetail_Previews: PreviewProvider {
    static var previews: some View {
        //ZoneDetail()
        Text("khsd")
    }
}

struct ZoneSearchBar: View {
    
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

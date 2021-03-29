//
//  ExhibitorView.swift
//  MobileApp
//
//  Created by etud on 11/03/2021.
//

import SwiftUI

struct ExhibitorListView: View {
    @State var searchText = ""
    @State var isSearching = false
    
    let persons = [Person(name:"Leoni", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Leo", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info"),Person(name:"Roger", etude: "Leo"), Person(name: "Rogerio", etude: "Info")]
    
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
                    
                    SearchBarExhibitor(searchText: $searchText, isSearching: $isSearching)
                    
                    ForEach(self.persons.filter(filterSearch)){ person in
                        NavigationLink(destination: ExhibitorDetail())
                        {
                            HStack {
                                ExhibitorRow(user: person)
                                Spacer()
                            }.padding()
                           
                        }
                    }
                }
                .navigationTitle("Exposants")
            } else {
                // Fallback on earlier versions
            }
        }
        
    }
}

struct ExhibitorListView_Previews: PreviewProvider {
    static var previews: some View {
        ExhibitorListView()
    }
}

struct SearchBarExhibitor: View {
    
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

struct ExhibitorRow: View {
    let user: Person
    
    var body: some View {
        HStack {
            Image(user.imageName)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                .frame(width: 70, height: 70)
            VStack (alignment: .leading) {
                Text(user.name).font(.headline)
                Text(user.etude).font(.subheadline).lineLimit(nil)
                }.padding(.leading, 8)
            }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
             .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}


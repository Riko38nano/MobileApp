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
    
    @ObservedObject var exposantViewModel = ExposantViewModel()
    
    private func filterSearch(exposant: Exposant) -> Bool{
        var ret = false
        if exposant.name.lowercased().contains(searchText.lowercased()) || searchText.isEmpty {
            ret = true
        }
        return ret
    }
    
    var body: some View {
        NavigationView {
            if #available(iOS 14.0, *) {
                
                ScrollView {
                    
                    SearchBarExhibitor(searchText: $searchText, isSearching: $isSearching)
                    
                    ForEach(self.exposantViewModel.exposants.filter(filterSearch)){ exposant in
                        NavigationLink(destination: ExhibitorDetail(exposant: exposant))
                        {
                            HStack {
                                ExhibitorRow(exposant: exposant)
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
    let exposant: Exposant
    
    var body: some View {
        HStack {
            Image("exposantIcon")
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                .frame(width: 70, height: 70)
            VStack (alignment: .leading) {
                Text(exposant.name).font(.headline)
                }.padding(.leading, 8)
            }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
             .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}


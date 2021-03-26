//
//  Hobby.swift
//  Swiftlycode
//
//  Created by Swiftly Code on 5/19/20.
//  Copyright © 2020 Swiftly Code. All rights reserved.
//
import SwiftUI

struct Hobby: View {
    @State var text = ""
    var body: some View {
        VStack {
            HStack {
                Text("Hobbies").font(.system(size: 50)).fontWeight(.heavy)
                Spacer()
                Image("photo").resizable().frame(width: 50, height: 50).cornerRadius(50)
            }
            HStack {
                HStack {
                    Text("Search a Hobby").padding()
                    Spacer()
                    Image(systemName: "magnifyingglass").padding()
                }
                .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                .foregroundColor(.secondary)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(80)
                .shadow(radius: 1).padding()
            }
            
            HStack (spacing: 14) {
                VStack {
                    Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.all, 20)
                    .background(Color.yellow)
                    .foregroundColor(.white).cornerRadius(100)
                    Text("Polo").font(.footnote)
                }
                VStack {
                    Image(systemName: "person.fill")
                    .resizable().frame(width: 30, height: 30)
                    .padding(.all, 20).background(Color.green)
                    .foregroundColor(.white).cornerRadius(100)
                    Text("Swimming").font(.footnote)
                }
                VStack {
                    Image(systemName: "person.fill").resizable()
                    .frame(width: 30, height: 30).padding(.all, 20).background(Color.red)
                    .foregroundColor(.white).cornerRadius(100)
                    Text("Singing").font(.footnote)
                }
                VStack {
                    Image(systemName: "person.fill").resizable()
                    .frame(width: 30, height: 30).padding(.all, 20).background(Color.blue)
                    .foregroundColor(.white).cornerRadius(100)
                    Text("Dancing").font(.footnote)
                }
            }
            
            HStack (spacing: 20) {
                Text("Favorites").font(.system(size: 24)).bold()
                Text("New").font(.system(size: 24)).bold().foregroundColor(.secondary)
                Spacer()
            }.padding(.vertical, 24).padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack (alignment: .leading, spacing: 20) {
                        HStack {
                            Image("photo").resizable().frame(width: 80, height: 80).cornerRadius(20)
                            Spacer()
                            Image(systemName: "arrowtriangle.right.fill").resizable()
                            .frame(width: 10, height: 10).foregroundColor(.gray)
                            .padding(.all, 24).background(Color.white).clipShape(Circle())
                        }
                        Text("Singing Sensation").font(.title).fontWeight(.heavy)
                        Text("After being enrolled in the Song Festival, you will be a singing sensation ")
                        .foregroundColor(.secondary).lineLimit(2)
                    }.padding(.horizontal, 24)
                }.frame(height: 230).background(Color.gray.opacity(0.2)).cornerRadius(36)
                
                VStack {
                    VStack (alignment: .leading, spacing: 20) {
                        HStack {
                            Image("photo").resizable().frame(width: 80, height: 80).cornerRadius(20)
                            Spacer()
                            Image(systemName: "arrowtriangle.right.fill").resizable()
                            .frame(width: 10, height: 10).foregroundColor(.gray)
                            .padding(.all, 24).background(Color.white).clipShape(Circle())
                        }
                        Text("Discover Hobby").font(.title).fontWeight(.heavy)
                        Text("Hobby").foregroundColor(.secondary).lineLimit(2)
                    }.padding(.horizontal, 24)
                }.frame(height: 230).background(Color.gray.opacity(0.2)).cornerRadius(36)
            }
        }.padding().edgesIgnoringSafeArea(.bottom)
    }
}

struct Hobby_Previews: PreviewProvider {
    static var previews: some View {
        Hobby()
    }
}

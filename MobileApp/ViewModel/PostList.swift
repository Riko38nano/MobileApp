//
//  PostList.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 01/04/2021.
//

import SwiftUI

struct PostList: View {
    //@ObservedObject var store = FestivalViewModel()
    @ObservedObject var store = GameViewModel()
    var body: some View {
        Text("dscdcdcd")
//        Spacer()
//        if(!store.games.isEmpty){
//        List(store.games ) { post in
//            VStack(alignment: .leading,spacing: 8) {
//                
//                    Text(post.state).font(.system(.title, design: .serif)).bold()
//                    Text(post.zone)
//                }
//            }
//        }else{
//            Text("no data")
//        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}


//
//  PostList.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 01/04/2021.
//

import SwiftUI

struct PostList: View {
    @ObservedObject var store = DataStore()
    
    var body: some View {
        Text("dscdcdcd")
        Spacer()
        //List(store.posts) { post in
            VStack(alignment: .leading,spacing: 8) {
                if let post = store.posts {
                    Text(post.name).font(.system(.title, design: .serif)).bold()
                    Text(post._id)
                }
                else{
                    Text("no data")
                }

            }
       // }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}


//
//  SwiftUIView.swift
//  MobileApp
//
//  Created by etud on 24/03/2021.
//

import SwiftUI

struct SwiftUIView: View {
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
            Spacer()
            
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}



//
//  FestivalDetailView.swift
//  MobileApp
//
//  Created by etud on 23/03/2021.
//

import SwiftUI

struct FestivalDetailView: View {
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

struct FestivalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FestivalDetailView()
            
    }
}

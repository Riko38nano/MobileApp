//
//  Zone.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 29/03/2021.
//

import SwiftUI
import Foundation

struct Zone: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        Text("Zone")
        Button(action: {
            withAnimation {
                viewRouter.currentPage = .page1
            }
        }) {
            BackButtonContent()
        }
    }
}

struct Zone_Previews: PreviewProvider {
    static var previews: some View {
        Zone().environmentObject(ViewRouter())
    }
}

struct BackButtonContent : View {
    var body: some View {
        return Text("Back")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .padding(.top, 50)
    }
}

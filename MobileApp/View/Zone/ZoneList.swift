//
//  Zone.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 29/03/2021.
//

import SwiftUI
import Foundation

struct ZoneList: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var zoneViewModel = ZoneViewModel()
    var body: some View {
        
        ScrollView{
            
            VStack{
                Text("Zones").modifier(FontModifier(style: .title))
                
                VStack{
                    VStack {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                        }.onTapGesture {
                            withAnimation {
                                viewRouter.currentPage = .page1
                            }
                        } .frame(width: 36, height: 36)
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(1)
                    }
                }
                    
               
                
                ForEach(self.zoneViewModel.zones){ zone in
                    NavigationLink(destination: ZoneDetail())
                    {
                        ZoneRow(zone: zone)
                    }
                }
        }.navigationTitle("Zones")
//        ScrollView {
//            VStack(spacing: 40){
//                Text("Zones").modifier(FontModifier(style: .title))
//
//                VStack {
//                    Image(systemName: "xmark")
//                        .font(.system(size: 16, weight: .medium))
//                        .foregroundColor(.white)
//                }.onTapGesture {
//                    withAnimation {
//                        viewRouter.currentPage = .page1
//                    }
//                }
//                .frame(width: 36, height: 36)
//                .background(Color.black)
//                .clipShape(Circle())
//                .opacity(1)
//
//
//                VStack {
//                    List(zoneViewModel.zones) { zone in
//                        NavigationLink(destination: ZoneDetail(zone: zone))
//                        {
//                            HStack {
//                                    Image(systemName: "square.and.arrow.up")
//                                        .font(.title)
//                                Text(zone.label)
//                                        .fontWeight(.semibold)
//                                        .font(.title)
//                            }.frame(minWidth: 0, maxWidth: .infinity)
//                            .padding()
//                            .foregroundColor(.white)
//                            .background(LinearGradient(gradient: Gradient(colors: [Color(.green), Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
//                            .cornerRadius(40)
//                            .padding(.horizontal, 20)
//
//                        }
//                    }
//                }
//            }
        
    }
}

struct ZoneList_Previews: PreviewProvider {
    static var previews: some View {
        //Zone().environmentObject(ViewRouter())
        Text("hsdjhs")
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

struct ZoneRow: View{
    var zone: Zone
    var body: some View{
        HStack {
            Text(zone.label)
                    .fontWeight(.semibold)
                    .font(.title)
        }.frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.green), Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(40)
        .padding(.horizontal, 20)
    }
}

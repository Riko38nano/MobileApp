//
//  GameDetail.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 28/03/2021.
//

import SwiftUI

struct GameDetail: View {
    @State private var isShowingSheetExposant = false
    @State private var isShowingSheetEditor = false
    var gameView: GameView
    var body: some View {
        ScrollView{
            VStack{
                Image("battle").resizable().aspectRatio(1.35, contentMode: .fill).frame(width:UIScreen.main.bounds.width,height: 500).offset(y: -200).padding(.bottom, -200)
                VStack{
                    VStack(alignment: .leading, spacing: 10){
                        Text(gameView.game.name).fontWeight(.heavy).font(.largeTitle)
                    }.padding()
                    VStack(spacing: 30.0){
                        HStack{
                            ZStack{
                                VStack(alignment: .leading){
                                    Text("Exposant")
                                        .fontWeight(.heavy)
                                        .foregroundColor(.white)
                                        .padding(.top, 8)
                                        .padding(.leading)
                                    Text(gameView.exhibitor.name)
                                        .font(.system(size: 13, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding(.top, 8)
                                        .padding(.leading)
                                    HStack{
                                        Button(action: { self.isShowingSheetExposant.toggle() }) {
                                            Text("voir")
                                                .font(.subheadline).bold()
                                                .foregroundColor(.white)
                                                .padding(.horizontal, 16)
                                                .padding(.vertical, 8)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .fill(Color.white.opacity(0.25))
                                                )
                                                .frame(width: 100, height: 24)
                                        }
//                                        .sheet(isPresented: $isShowingSheetExposant) {
//                                            ExhibitorDetail()
//                                        }
                                        
                                        
                                        Image("exposantIcon")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 68, height: 68)
                                            .padding([.bottom, .trailing], 4)
                                            
                                    }
                                }
                            }
                            .background(Color.blue)
                            .cornerRadius(12)
                            .shadow(color: .green, radius: 6, x: 0.0, y: 0.0)
                            
                            ZStack{
                                VStack(alignment: .leading){
                                    Text("Editor")
                                        .fontWeight(.heavy)
                                        .foregroundColor(.white)
                                        .padding(.top, 8)
                                        .padding(.leading)
                                    Text(gameView.editor.name)
                                        .font(.system(size: 13, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding(.top, 8)
                                        .padding(.leading)
                                    HStack{
                                        Button(action: { self.isShowingSheetExposant.toggle() }) {
                                            Text("voir")
                                                .font(.subheadline).bold()
                                                .foregroundColor(.white)
                                                .padding(.horizontal, 16)
                                                .padding(.vertical, 8)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .fill(Color.white.opacity(0.25))
                                                )
                                                .frame(width: 100, height: 24)
                                        }
//                                        .sheet(isPresented: $isShowingSheetEditor) {
//                                            EditorDetail()
//                                        }
                                        
                                        
                                        Image("editorIcon")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 68, height: 68)
                                            .padding([.bottom, .trailing], 4)
                                            
                                    }
                                }
                            }
                            .background(Color.blue)
                            .cornerRadius(12)
                            .shadow(color: .green, radius: 6, x: 0.0, y: 0.0)
                        }
                        .frame(maxWidth: .infinity)
                        
                        HStack(spacing: 20.0) {
                            RingView(age: CGFloat(gameView.game.min_yearold))
                                .animation(Animation.easeInOut.delay(0.3))
                            
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text("Durée").fontWeight(.bold)
                                Text("\(gameView.game.duration) min")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .lineSpacing(4)
                            }
                            .padding(20)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
                        }
                        VStack{
                            HStack {
                                Text("Catégorie")
                                Spacer()
                                Text(gameView.game.category)
                                    .foregroundColor(.gray)
                                    .font(.callout)
                            }
                            HStack {
                                Text("Prototype")
                                Spacer()
                                if(gameView.proto){
                                    Text("Oui")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                }else{
                                    Text("Non")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                }
                                
                            }
                            HStack {
                                Text("Zone")
                                Spacer()
                                Text(gameView.zone)
                                    .foregroundColor(.gray)
                                    .font(.callout)
                            }
                        }.frame(width: 300, height: 220)
                    }
                }
            }
        }
    }
}



struct GameDetail_Previews: PreviewProvider {
    static var previews: some View {
        //var gameViewModel = GameViewModel()
        //GameDetail(gameView: gameViewModel[0])
        Text("NEKKE")
    }
}


struct RingView: View {
let color1 = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
var color2 = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
var width: CGFloat = 88
var height: CGFloat = 88
var age: CGFloat

var body: some View {
    let multiplier = width / 44
    return ZStack {
        Circle()
            .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
            .frame(width: width, height: height)
        
        Circle()
            .trim(from: 0, to: 1)
            .stroke(
                LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .topTrailing, endPoint: .bottomLeading),
                style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
            )
            .rotationEffect(Angle(degrees: 90))
            .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
            .frame(width: width, height: height)
            .shadow(color: Color(color2).opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
        
        Text("\(Int(age)) ans")
            .font(.system(size: 10 * multiplier))
            .fontWeight(.bold)

    }
}
}


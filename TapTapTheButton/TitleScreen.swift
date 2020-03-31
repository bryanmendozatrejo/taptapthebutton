//
//  TitleScreen.swift
//  TapTapTheButton
//
//  Created by Bryan Mendoza on 3/2/20.
//  Copyright © 2020 Bryan Mendoza. All rights reserved.
//

import SwiftUI

struct TitleScreen : View {
    @EnvironmentObject var user: User
    @State var message = "click 'play' to start"
    @State var showMessage = false
    var body: some View {
       // GeometryReader { geometry in
        VStack { ZStack { //for background -> Black
            Color.black
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                withAnimation {
                    self.showMessage = true
                }
            }
//            Button(action: {
//                withAnimation {
//                    self.showMessage = true
//                }
//            }) {
//                Color.black
//                .edgesIgnoringSafeArea(.all)
//            }
            VStack {
                
                VStack {

                    Button(action: {
                          withAnimation {
                              self.showMessage = true
                          }
                      }) {
                          Text("TapTapTheButton!")
                            .font(.custom("courier", size: 37))
                            .foregroundColor(Color.black)
                            .fontWeight(.bold)
                            .padding()
                            .background(Color.white)
                            .padding(10)
                            .border(Color.white, width: 5)
                        
                      }
                    //Spacer()
                }.padding(.top, 25)
                Spacer() //pushes title to top
                VStack {
                    Button(action: {
                        withAnimation {
                            self.user.View = User.Views.GameScreen
                        }
                    }) {
                        HStack {
                            Text("Play")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .font(.custom("courier", size: 30))
//                            Image("white_play_button")
//                            .renderingMode(.original)
//                            .resizable()
//                            .frame(width: 30, height: 30)
                            }.padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.white, lineWidth: 5)
                            )
                    }
                }

                Spacer() //centers play
                VStack {
                    Button(action: {
                        withAnimation {
                            self.user.View = User.Views.HowToPlayScreen
                        }
                    }) {
                        
                        HStack {
                            Text("How to Play")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .font(.custom("courier", size: 20))
                            .padding()
                        }
                    }
                    if (showMessage == true) {
                        Text("\(message)")
                        .foregroundColor(Color.white)
                        .font(.custom("courier", size: 15))
                    }
                }
            }//closes VStack
 //       }//clses Geometry
        }} //closes background
    }//closes some View
}//closes struct

//#if DEBUG
struct TitleScreen_Preview: PreviewProvider {
    static var previews: some View {
        TitleScreen().environmentObject(User())
    }
}
//#endif

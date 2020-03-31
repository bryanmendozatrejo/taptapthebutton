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
//        Color.black
//        .edgesIgnoringSafeArea(.all)
//        .onTapGesture {
//            self.showMessage = true
//        }
        Button(action: {
            withAnimation {
                self.showMessage = true
            }
        }) {
            Color.black
            .edgesIgnoringSafeArea(.all)
        }
        VStack {
            
            VStack {
//                Text("TapTapTheButton!")
//                    .foregroundColor(Color.white)
//                    .font(.custom("courier", size: 40))
//                    .onTapGesture {
//                        self.showMessage = true
//                    }
                Button(action: {
                      withAnimation {
                          self.showMessage = true
                      }
                  }) {
                      Text("TapTapTheButton!")
                      .foregroundColor(Color.white)
                      .font(.custom("courier", size: 40))
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
                        .foregroundColor(Color.white)
                        .font(.custom("courier", size: 30))
                        Image("white_play_button")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 30, height: 30)
                    }
                }
            }
//            HStack {
//                Text("Play")
//                .foregroundColor(Color.white)
//                .font(.custom("courier", size: 30))
//                Image("white_play_button")
//                .resizable()
//                .frame(width: 30, height: 30)
//            }.onTapGesture {
//                self.user.View = User.Views.GameScreen
//            }
            Spacer() //centers play
            VStack {
                //Text("How to Play")
                if (showMessage == true) {
                    Text("\(message)")
                    .foregroundColor(Color.white)
                    .font(.custom("courier", size: 20))
                }
            }
        }//closes VStack
 //       }//clses Geometry
        }} //closes background
    }//closes some View
}//closes struct

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        AnyTransition.slide
    }
}

//#if DEBUG
struct TitleScreen_Preview: PreviewProvider {
    static var previews: some View {
        TitleScreen().environmentObject(User())
    }
}
//#endif

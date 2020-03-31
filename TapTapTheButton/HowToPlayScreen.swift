//
//  HowToPlayScreen.swift
//  TapTapTheButton
//
//  Created by Bryan Mendoza on 3/31/20.
//  Copyright © 2020 Bryan Mendoza. All rights reserved.
//

import SwiftUI

struct HowToPlayScreen : View {
@EnvironmentObject var user: User
    var body: some View {
    VStack { ZStack {
        Color.black
        .edgesIgnoringSafeArea(.all)
        VStack {
            VStack {
                Text("How To Play")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .font(.custom("courier", size: 40))
            }.padding(.top, 20)
            Spacer()
            HStack {
                Text("Tap the button on screen without running out of time. Each successful tap will increase your score and time.")
                .foregroundColor(Color.white)
                .font(.custom("courier", size: 20))
            }.padding(10)
            VStack {
                Text("Warning: tapping the background instead of the button will result in an instant loss!")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .font(.custom("courier", size: 15))
                .padding()
                .border(Color.white, width: 3)
            }.padding(5)
            Spacer()
            VStack {
                Button(action: {
                    withAnimation {
                        self.user.View = User.Views.TitleScreen
                    }
                }) {
                    HStack {
                        Image("back_arrow")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.white, lineWidth: 3)
                        )
                    }
                }
            }
        }
    }}
    }
}
struct HowToPlayScreen_Preview: PreviewProvider {
    static var previews: some View {
        HowToPlayScreen().environmentObject(User())
    }
}

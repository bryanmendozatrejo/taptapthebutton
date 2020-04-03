//
//  GameOver.swift
//  TapTapTheButton
//
//  Created by Bryan Mendoza on 3/11/20.
//  Copyright © 2020 Bryan Mendoza. All rights reserved.
//


import SwiftUI

struct GameOverScreen: View {
@EnvironmentObject var user: User
    var body: some View {
    VStack { ZStack { //for background -> Black
    Color.black
    .edgesIgnoringSafeArea(.all)
        VStack {
            HStack (spacing: 210) {
            Text("HIGH SCORE: ")
                .foregroundColor(Color.white)
                .font(.custom("courier", size: 20))
            Text("\(user.highScore)")
                .font(.custom("courier", size: 20))
                .foregroundColor(Color.white)
            }.padding()
            .border(Color.white, width: 5)
            Spacer()
            Text("Final Score: \(user.score)")
            .font(.custom("courier", size: 35))
            .foregroundColor(Color.black)
            .fontWeight(.bold)
            .padding()
            .background(Color.white)
            .padding(10)
            .border(Color.white, width: 5)
            //replace with user's score
            Spacer()
            VStack {
                Text("Play Again?")
                .foregroundColor(Color.white)
                .font(.custom("courier", size: 20))
                Button(action: {
                    withAnimation {
                        self.user.View = User.Views.TitleScreen
                        if (self.user.gameOver == true) {
                        self.user.score = 0 //resets score
                        self.user.userScore = 0 //resets for highScore
                        self.user.timeRemaining = 10.02 //resets time
                        self.user.gameOver = false
                        }
                    }
                }) {
                    VStack {
                        Image("white_retry")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 30, height: 30)
                        .padding(7)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.white, lineWidth: 3)
                        )
                    }
                  }
            }
        }
    }}//closes VStack/ZStack
}//closes some View
}//closes struct
//#if DEBUG
struct GameOverScreen_Preview: PreviewProvider {
    static var previews: some View {
        GameOverScreen().environmentObject(User())
    }
}
//#endif

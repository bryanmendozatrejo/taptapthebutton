//
//  GameOver.swift
//  TapTapTheButton
//
//  Created by Bryan Mendoza on 3/11/20.
//  Copyright © 2020 Bryan Mendoza. All rights reserved.
//


import SwiftUI

struct GameOver: View {
@EnvironmentObject var user: User
    var body: some View {
    VStack { ZStack { //for background -> Black
    Color.black
    .edgesIgnoringSafeArea(.all)
        VStack {
//            VStack {
//                Text("HIGH SCORE: \(user.highScore)")
//                .font(.custom("courier", size: 20))
//                .foregroundColor(Color.white)
//            }.padding()
            Spacer()
            Text("Final Score: \(user.score)")
            .font(.custom("courier", size: 40))
            .foregroundColor(Color.white)
            //replace with user's score
            Spacer()
            VStack {
                Button(action: {
                    withAnimation {
                        self.user.View = User.Views.TitleScreen
                        if (self.user.gameOver == true) {
                        self.user.score = self.user.userScore
                            if (self.user.userScore > self.user.highScore){
                                self.user.userScore = self.user.highScore
                            }
                        self.user.score = 0 //resets score
                        }
                    }
                }) {
                    VStack {
                        Text("Play Again?")
                        .foregroundColor(Color.white)
                        .font(.custom("courier", size: 20))
                        Image("white_retry")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 30, height: 30)
                    }
                  }
            }
        }
    }}//closes VStack/ZStack
}//closes some View
}//closes struct
//#if DEBUG
struct GameOver_Preview: PreviewProvider {
    static var previews: some View {
        GameOver().environmentObject(User())
    }
}
//#endif

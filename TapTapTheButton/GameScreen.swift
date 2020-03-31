//
//  GameScreen.swift
//  TapTapTheButton
//
//  Created by Bryan Mendoza on 3/2/20.
//  Copyright © 2020 Bryan Mendoza. All rights reserved.
//

import SwiftUI

struct GameScreen : View {
@EnvironmentObject var user: User
    @State var showIncrease = false
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            ZStack {
                //background was tapped! = GameOver -> True
                Button(action: {
                    withAnimation {
                        self.user.gameOver = true
                        if (self.user.gameOver == true) {
                            if (self.user.userScore > self.user.highScore){
                                self.user.highScore = self.user.userScore
                            }
                        }
                        self.user.View = User.Views.GameOverScreen
                    }
                }) {
                    Color.black
                    .edgesIgnoringSafeArea(.all)
                }

                VStack() {
                    HStack (spacing: 125) {
                        Text("Score: \(user.score)")
                            .foregroundColor(Color.white)
                            .font(.custom("courier", size: 20))
                        Text("Time: \(user.timeRemaining, specifier: "%.2f")s")
                        .onReceive(timer) { _ in
                            if self.user.timeRemaining > 0.01 {
                                self.user.timeWasIncreased = false
                                self.user.timeRemaining -= 0.01
                            }
                            else {
                                withAnimation {
                                    self.user.gameOver = true
                                    self.user.View = User.Views.GameOverScreen
                                    if (self.user.gameOver == true) {
                                        if (self.user.userScore > self.user.highScore){
                                            self.user.highScore = self.user.userScore
                                        }
                                    }
                                }
                            }
                        }
                        .font(.custom("courier", size: 20))
                        .foregroundColor(Color.white)
                        }.padding()
                        .border(Color.white, width: 5)
                
                Spacer() //moves score and time to top & button?
                }

                VStack { //button
                    VStack {
                        Spacer()
                        self.button()
                        //.offset(x: self.random(), y: self.random())
                    }
                    Spacer()
                    VStack {
                        Spacer()
                        if (showIncrease == true) {
                            Text("+0\(self.user.showTimeIncrease,specifier: "%.2f")s")
                            .foregroundColor(Color.green)
                        }
                    }
                }
                
            }//closes ZStack
        }//closes VStack
    }//closes some View
func button() -> some View {
    VStack {// test button
    //Spacer() //moves button to bottom
        Image("white_button")
        .resizable()
        .renderingMode(.original)
        .frame(width: 75, height: 75)
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.white, lineWidth: 5)
        )
        .onTapGesture {
            //self.offset(x: 50,y: 0)
            self.user.gameOver = false
            self.user.score += 1
            self.user.userScore += 1
            self.user.timeRemaining = self.user.timeRemaining + Double(self.timeIncrease())
            self.user.timeWasIncreased = true
            self.showIncrease = true
            if (self.user.timeWasIncreased == true) {
                self.user.showTimeIncrease = Double(self.timeIncrease())
            }
        }
    }
}//closes button function
func random() -> CGFloat {
    CGFloat.random(in: 1..<50)
}
func timeIncrease() -> CGFloat {
    CGFloat.random(in: 00.00..<00.50)
}

}//closes Struct
//#if DEBUG
struct GameScreen_Preview: PreviewProvider {
    static var previews: some View {
        GameScreen().environmentObject(User())
    }
}
//#endif

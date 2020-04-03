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
@State private var x_position = [50,75,100,125,150,175,200,225,250,275,300,325,350].shuffled()
@State private var x_index = Int.random(in: 0...2)
@State private var y_position = [100,125,150,175,200,225,250,275,300,325,350,375,400,425,450,475,500,525,550,575,600,625,650,675,700,725,750,775,800].shuffled()
@State private var y_index = Int.random(in: 0...2)
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    var body: some View {
    //GeometryReader { geometry in
       // VStack {
        VStack {
            ZStack {
                //background was tapped! = GameOver -> True
                Button(action: {
                    withAnimation {
                        self.user.gameOver = true
                        if (self.user.userScore > self.user.highScore){
                            self.user.highScore = self.user.userScore
                        }
                        self.GameOver()
                    }
                }) {
                    Color.black
                    .edgesIgnoringSafeArea(.all)
                }
                VStack (alignment: .leading) {
                Button (action: {
                    withAnimation {
                        self.user.gameOver = true
                        if (self.user.userScore > self.user.highScore){
                            self.user.highScore = self.user.userScore
                        }
                        self.GameOver()
                    }
                }) {
                    if (self.user.timeRemaining > 0.1 && self.user.gameOver == false) {
                        self.button()
                        .position(x: CGFloat(self.x_position[self.x_index]), y: CGFloat(self.y_position[self.y_index]))
                    }
                }
                }
                    
                VStack() {
                    HStack (spacing: 115) {
                        Text("Score: \(self.user.score)")
                            .foregroundColor(Color.white)
                            .font(.custom("courier", size: 20))
                        Text("Time: \(self.user.timeRemaining, specifier: "%.2f")s")
                            .onReceive(self.timer) { _ in
                            if self.user.timeRemaining > 0.01 {
                                self.user.timeWasIncreased = false
                                self.user.timeRemaining -= 0.01
                            }
                            else {
                                //out of time! = GameOver -> True
                                withAnimation {
                                    self.user.gameOver = true
                                    if (self.user.userScore > self.user.highScore){
                                        self.user.highScore = self.user.userScore
                                    }
                                    self.GameOver()
                                }
                            }
                        }
                        .font(.custom("courier", size: 20))
                        .foregroundColor(Color.white)
                        }.padding()
                        .border(Color.white, width: 5)
                    Spacer() //moves score and time to top
                }
                
                VStack {
                    Spacer()
                    VStack {
                        Spacer()
                        if (self.showIncrease == true) {
                            Text("+0\(self.user.showTimeIncrease,specifier: "%.2f")s")
                            .foregroundColor(Color.green)
                        }
                    }
                }
            }//closes ZStack
        }//closes VStack
//}}//closes GeometryReader
    }//closes some View
    
func button() -> some View {
    withAnimation {// button
        Image("white_button")
        .resizable()
        .renderingMode(.original)
        .frame(width: 75, height: 75)
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.white, lineWidth: 5)
            )
        .onTapGesture {
            self.user.gameOver = false
            self.user.score += 1
            self.user.userScore += 1
            self.user.timeRemaining = self.user.timeRemaining + Double(self.timeIncrease())
            self.user.timeWasIncreased = true
            withAnimation {
                self.showIncrease = true
            }
            if (self.user.timeWasIncreased == true) {
                self.user.showTimeIncrease = Double(self.timeIncrease())
            }
            self.x_position.shuffle()
            self.y_position.shuffle()
        }
    }
}//closes button function
    
func timeIncrease() -> CGFloat {
    CGFloat.random(in: 00.00..<00.50)
}
func GameOver() {
  self.user.View = User.Views.GameOverScreen
}
    
}//closes GameScreen

//#if DEBUG
struct GameScreen_Preview: PreviewProvider {
    static var previews: some View {
        GameScreen().environmentObject(User())
    }
}
//#endif

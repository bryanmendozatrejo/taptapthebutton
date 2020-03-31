//
//  GameScreen.swift
//  TapTapTheButton
//
//  Created by Bryan Mendoza on 3/2/20.
//  Copyright © 2020 Bryan Mendoza. All rights reserved.
//

import SwiftUI

//struct Button: View {
//@EnvironmentObject var user: User
//    var body: some View {
//        VStack { //button on top
//        //Spacer() //moves button to bottom
//            Image("white_button")
//            .resizable()
//            .frame(width: 75, height: 75)
//            .onTapGesture {
//                self.user.gameOver = false
//                self.user.score += 1
//            }
//        }//.padding(.top, 50) //shifts button down
//    }
//}

struct GameScreen : View {
@EnvironmentObject var user: User
    @State var timeRemaining = 10.02 // -> shows 10.00s on screen
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            ZStack {
                //background was tapped! = GameOver -> True
                Button(action: {
                    withAnimation {
                        self.user.gameOver = true
                        self.user.View = User.Views.GameOver
                    }
                }) {
                    Color.black
                    .edgesIgnoringSafeArea(.all)
                }
//                Color.black
//                .edgesIgnoringSafeArea(.all)
//                .onTapGesture {
//                    self.user.gameOver = true
//                    self.user.View = User.Views.GameOver
//                }
                VStack() {
                    HStack (spacing: 275) {
                        Text("Score: ")
                            .foregroundColor(Color.white)
                            .font(.custom("courier", size: 20))
                        Text("\(user.score)")
                            .font(.custom("courier", size: 20))
                            .foregroundColor(Color.white)
                    }
                    .padding(.bottom, 25) //space between score & time
                    Text("Time: \(timeRemaining, specifier: "%.2f")s")
                        .onReceive(timer) { _ in
                            if self.timeRemaining > 0 {
                                self.timeRemaining -= 0.01
                            }
                            else {
                                withAnimation {
                                    self.user.gameOver = true
                                    self.user.View = User.Views.GameOver
                                }
                            }
                        }
                        .font(.custom("courier", size: 20))
                        .foregroundColor(Color.white)
//                    VStack { //button on top
//                    //Spacer() //moves button to bottom
//                        Image("white_button")
//                        .resizable()
//                        .frame(width: 75, height: 75)
//                        .onTapGesture {
//                            self.user.gameOver = false
//                            self.user.score += 1
//                        }
//                    }//.padding(.top, 50) //shifts button down
                
                Spacer() //moves score and time to top + button?
                }
                
                VStack {//button on center
                //Spacer() //moves button to bottom
                    Image("white_button")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 75, height: 75)
                    .onTapGesture {
                        self.user.gameOver = false
                        self.user.score += 1
                    }
                }
                
//                VStack {// test button
//                    self.button()
//                        //.offset(x: self.random(), y: self.random())
//                }
                
//                VStack {//button on bottom
//                Spacer() //moves button to bottom
//                    Image("white_button")
//                    .resizable()
//                    .frame(width: 75, height: 75)
//                    .onTapGesture {
//                        self.user.gameOver = false
//                        self.user.score += 1
//                    }
//                }
                
            }//closes ZStack
        }//closes VStack
    }//closes some View
func button() -> some View {
    VStack {// test button
    //Spacer() //moves button to bottom
        Image("white_button")
        .resizable()
        .frame(width: 75, height: 75)
        .onTapGesture {
            //self.offset(x: 50,y: 0)
            self.user.gameOver = false
            self.user.score += 1
        }
    }
}//closes button function
func random() -> CGFloat {
    CGFloat.random(in: 1..<50)
}
}//closes Struct
//#if DEBUG
struct GameScreen_Preview: PreviewProvider {
    static var previews: some View {
        GameScreen().environmentObject(User())
    }
}
//#endif

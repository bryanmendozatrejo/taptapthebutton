//
//  User.swift
//  TapTapTheButton
//
//  Created by Bryan Mendoza on 3/2/20.
//  Copyright © 2020 Bryan Mendoza. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    enum Views {
        case TitleScreen
        case GameScreen
        case GameOverScreen
        case GameOver
    }
    @Published var View = Views.TitleScreen
    @Published var score = 0
    @Published var gameOver = false
    @Published var userScore = 0
    @Published var highScore = 0
    //@Published var countDown = 00.0s
}

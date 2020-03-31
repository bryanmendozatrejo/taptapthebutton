//
//  ScreenViews.swift
//  TapTapTheButton
//
//  Created by Bryan Mendoza on 3/11/20.
//  Copyright © 2020 Bryan Mendoza. All rights reserved.
//

import SwiftUI

struct ScreenViews: View {
    @EnvironmentObject var user: User
    var body: some View {
        VStack {
            if self.user.View == User.Views.TitleScreen {
                TitleScreen()
            }
            else if self.user.View == User.Views.GameScreen {
                GameScreen()
            }
            else if self.user.View == User.Views.GameOverScreen{
                GameOverScreen()
            }
            else if self.user.View == User.Views.HowToPlayScreen {
                HowToPlayScreen()
            }
            else if self.user.View == User.Views.ContentView {
                ContentView()
            }
        }
    }
}

struct ScreenViews_Previews: PreviewProvider {
    static var previews: some View {
        ScreenViews().environmentObject(User())
    }
}

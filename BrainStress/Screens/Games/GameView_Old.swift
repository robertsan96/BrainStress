//
//  GameView.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import SwiftUI

struct GameView_old: View {
    
    @EnvironmentObject var gameModel: GameModel
    
    var body: some View {
        ZStack {
//            BackgroundView().edgesIgnoringSafeArea(.all)
            switch gameModel.gameState {
            case .warmUp: GameWarmUpView()
            case .playing, .paused:
                VStack {
                    GameTopView()
                    Spacer()
                    GameMidView()
                        .padding(.top, 20)
                    Spacer()
                    GameBottomView()
                        .padding(.bottom, 10)
                }
            case .end(_):
                EmptyView()
            default: Text("Ok dk")
            }
        }
        .modifier(AdaptsToSoftwareKeyboard())
        .navigationBarHidden(true)
    }
}

struct GameView_Old_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            GameView()
                .preferredColorScheme(.dark)
                .environmentObject(GameModel(quiz: QuizData.Math.dummyLevel()))
        }
    }
}

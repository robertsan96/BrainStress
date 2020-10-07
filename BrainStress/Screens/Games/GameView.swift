//
//  GameView.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var gameModel: GameModel
    
    var body: some View {
        ZStack {
            BackgroundView().edgesIgnoringSafeArea(.all)
            switch gameModel.gameState {
            case .warmUp: GameWarmUpView()
            case .playing, .paused:
                VStack {
                    GameTopView()
                    Spacer()
                    GameMidView()
                    GameBottomView()
                }
            default: Text("Ok dk")
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            GameView()
                .preferredColorScheme(.dark)
                .environmentObject(GameModel(quiz: QuizData.Math.dummyLevel()))
        }
    }
}

struct GameMidView: View {
    
    @EnvironmentObject var gameModel: GameModel
    
    var body: some View {
        VStack {
            Text("\(gameModel.quizItem?.text ?? "")")
        }
    }
}

struct GameBottomView: View {
    
    @EnvironmentObject var gameModel: GameModel
    
    var body: some View {
        Text("Bottom")
    }
}

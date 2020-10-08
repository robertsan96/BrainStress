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
                    Spacer()
                    GameBottomView()
                }
            case .end(_):
                GameEndView()
            default: Text("Ok dk")
            }
        }
        .modifier(AdaptsToSoftwareKeyboard())
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
            Spacer()
            Text("\(gameModel.quizItem?.text ?? "")")
                .modifier(BrainStressFont(color: Color.pink, size: 36))
            Spacer()
            TextField("Your Answer", text: $gameModel.quizItemUAnswer, onCommit: {
                gameModel.addAnswerToList(answer: gameModel.quizItemUAnswer)
            })
            .multilineTextAlignment(.center)
            .modifier(BrainStressFont(color: Color.white, size: 46))
            Spacer()
            Spacer()
        }
    }
}

struct GameBottomView: View {
    
    @EnvironmentObject var gameModel: GameModel
    
    var body: some View {
        Text("Bottom")
    }
}

//
//  GameBottomView.swift
//  BrainStress
//
//  Created by Robert Sandru on 09/10/2020.
//

import SwiftUI

struct GameBottomView: View {
    @EnvironmentObject var gameModel: GameModel
    
    var body: some View {
        MathKeyboardView(text: $gameModel.quizItemUAnswer) {
            gameModel.addAnswerToList(answer: gameModel.quizItemUAnswer)
        }
    }
}

struct GameBottomView_Previews: PreviewProvider {
    static var previews: some View {
        GameBottomView()
            .environmentObject(GameModel(quiz: QuizData.Math.dummyLevel()))
            .preferredColorScheme(.dark)
    }
}

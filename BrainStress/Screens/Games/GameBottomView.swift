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

struct KeyView: View {
    
    var title: String?
    var image: String?
    var backgroundColor: Color = Color.pink
    
    var body: some View {
        VStack {
            if title != nil {
                Text(title!)
                    .modifier(BrainStressFont(color: Color.white, size: 36))
                    .padding()
            }
            if image != nil {
                Image(systemName: image!)
                    .foregroundColor(Color.pink)
                    .frame(maxWidth: 30, minHeight: 30, maxHeight: 30)
                    .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(image == nil ? backgroundColor : Color.clear)
        .border(backgroundColor, width: 3)
        .cornerRadius(5)
    }
}

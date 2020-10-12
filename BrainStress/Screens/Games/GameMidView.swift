//
//  GameMidView.swift
//  BrainStress
//
//  Created by Robert Sandru on 09/10/2020.
//

import SwiftUI

struct GameMidView: View {
    
    @EnvironmentObject var gameModel: GameModel
    
    @State var textField: UITextField?
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(gameModel.quizItem?.text ?? "")")
                .modifier(BrainStressFont(color: Color.pink, size: 36))
            BrainStressKeyboard() { text in
                gameModel.addAnswerToList(answer: text)
            }
            Spacer()
            Spacer()
        }
    }
    
}

struct GameMidView_Previews: PreviewProvider {
    static var previews: some View {
        GameMidView()
            .environmentObject(GameModel(quiz: QuizData.Math.dummyLevel()))
            .preferredColorScheme(.dark)
    }
}

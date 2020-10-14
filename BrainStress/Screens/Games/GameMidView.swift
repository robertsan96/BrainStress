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
            Text("\(gameModel.quizItem?.text ?? "")")
                .multilineTextAlignment(.center)
                .modifier(BrainStressFont(color: Color.pink, size: gameModel.quizItem?.text.count ?? 0 > 10 ? 14 : 36))
            Text(gameModel.quizItemUAnswer)
                .modifier(BrainStressFont(color: Color.pink, size: 52))
                .padding()
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

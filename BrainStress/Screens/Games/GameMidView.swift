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
                .frame(height: 50)
                .modifier(BrainStressFont(color: Color.pink, size: 36))
            Spacer()
            Text(gameModel.quizItemUAnswer)
                .modifier(BrainStressFont(color: Color.pink, size: 52))
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

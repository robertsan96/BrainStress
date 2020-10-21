//
//  GameWarmUpView.swift
//  BrainStress
//
//  Created by Robert Sandru on 07/10/2020.
//

import SwiftUI

struct GameWarmUpView: View {
    
    @EnvironmentObject var gameModel: GameModel
    
    var body: some View {
        VStack {
            Spacer()

            Text("Warm up...")
                .modifier(BrainStressFont(color: Color.pink, size: 42))
            Text("You will need it.")
                .modifier(BrainStressFont(color: Color.white, size: 22))
                .padding()
            Text("\(gameModel.timeRemainingFoWarmUp)")
                .modifier(BrainStressFont(size: 32))
            Spacer()
            Spacer()
        }
    }
}

struct GameWarmUpView_Previews: PreviewProvider {
    static var previews: some View {
        GameWarmUpView()
            .environmentObject(GameModel(quiz: QuizData.Math.dummyLevel()))
            .preferredColorScheme(.dark)
    }
}

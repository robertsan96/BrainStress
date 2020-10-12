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
        Text("Bottom")
    }
}

struct GameBottomView_Previews: PreviewProvider {
    static var previews: some View {
        GameBottomView()
            .environmentObject(GameModel(quiz: QuizData.Math.dummyLevel()))
            .preferredColorScheme(.dark)
    }
}

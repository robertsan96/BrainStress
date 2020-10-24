//
//  WarmupView.swift
//  BrainStress
//
//  Created by Robert Sandru on 24/10/2020.
//

import SwiftUI

struct WarmupView: View {
    
    @EnvironmentObject var gameModel: GameModel
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text(gameModel.quiz.title)
                    .font(.system(size: 37, weight: .bold, design: .rounded))
                Spacer()
                Circle()
                    .strokeBorder(Color("AccentColor"), lineWidth: 5)
                    .frame(width: 125, height: 125)
                    .overlay(
                        Text(String(gameModel.timeRemainingFoWarmUp))
                            .font(.system(size: 37, weight: .semibold, design: .rounded))
                            .foregroundColor(Color("AccentColor"))
                    )
                Spacer()
                Text(gameModel.quiz.description)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16, weight: .light, design: .rounded))
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .background(Color("Bg1"))
        .navigationBarHidden(true)
    }
}

struct WarmupView_Previews: PreviewProvider {
    static var previews: some View {
        WarmupView()
            .environmentObject(GameModel(quiz: QuizData.Math.addition1()))
            .preferredColorScheme(.dark)
    }
}

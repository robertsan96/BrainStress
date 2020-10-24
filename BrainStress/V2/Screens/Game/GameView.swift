//
//  GameView.swift
//  BrainStress
//
//  Created by Robert Sandru on 24/10/2020.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var gameModel: GameModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Bg1"))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    HStack {
                        Text(gameModel.quiz.title)
                            .font(.system(size: 25, weight: .semibold, design: .rounded))
                        Spacer()
                        Button(action: {}, label: {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .frame(width: 30)
                                .frame(maxHeight: 30)
                        })
                    }
                    .padding()
                    GameTopQuizItemScroller()
                    Spacer()
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color("Dark4"))
                }
                .frame(maxWidth: .infinity, maxHeight: 130)
                Spacer()
            }
            
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(GameModel(quiz: QuizData.Math.addition1()))
            .preferredColorScheme(.dark)
    }
}

//
//  GameTopQuizItemScroller.swift
//  BrainStress
//
//  Created by Robert Sandru on 24/10/2020.
//

import SwiftUI

struct GameTopQuizItemScroller: View {
    
    @EnvironmentObject var gameModel: GameModel
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { proxy in
                    HStack(alignment: .center, spacing: 25) {
                        ForEach(gameModel.originalQuiz.items.indices, id:\.self) { itemIndex in
                            if gameModel.isActive(itemNumber: itemIndex) {
                                VStack(spacing: 0) {
                                    Circle()
                                        .frame(width: 35, height: 35)
                                        .foregroundColor(Color("AccentColor"))
                                        .overlay(
                                            VStack(spacing: 0) {
                                                Text("\(itemIndex + 1)")
                                            }
                                        )
                                }
                            } else if gameModel.inQueue(itemNumber: itemIndex) {
                                VStack(spacing: 0) {
                                    Text("\(itemIndex + 1)")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(Color("TextGreyColor"))
                                }
                            } else {
                                VStack(spacing: 0) {
                                    Text("\(itemIndex + 1)")
                                        .font(.system(size: 16, weight: .bold))
                                    Rectangle()
                                        .frame(width: 15, height: 3)
                                        .foregroundColor(gameModel.isSolved(itemNumber: itemIndex) ? .green : .red)
                                }
                            }
                        }
                        .onChange(of: gameModel.quizItemNumber, perform: { value in
                            proxy.scrollTo(value)
                        })
                    }
                }
            }
        }
        .padding()
    }
}

struct GameTopQuizItemScroller_Previews: PreviewProvider {
    static var previews: some View {
        GameTopQuizItemScroller()
            .environmentObject(GameModel(quiz: QuizData.Math.addition1()))
            .preferredColorScheme(.dark)
    }
}

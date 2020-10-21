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
        switch gameModel.quiz.category {
        case .math:
            MathKeyboardView(text: $gameModel.quizItemUAnswer) {
                gameModel.addAnswerToList(answer: gameModel.quizItemUAnswer)
            }
        case .geography:
            switch gameModel.quizItem?.answer.type {
            case .singleChoice:
                VStack {
                    ForEach(gameModel.quizItem?.answer.mergeShuffle ?? [],
                            id: \.self) { answ in
                        Button(action: {
                            gameModel.quizItemUAnswer = answ.lowercased()
                            gameModel.addAnswerToList(answer: answ.lowercased())
                        }, label: {
                            HStack {
                                Spacer()
                                Text(answ)
                                    .modifier(BrainStressFont(size: 26))
                                    .padding()
                                Spacer()
                            }
                            .border(Color.pink, width: 2)
                            .padding([.leading, .trailing])
                        })
                    }
                }
                .frame(maxWidth: .infinity)
            case .text:
                //                BrainStressKeyboard() { da in
                //                    gameModel.quizItemUAnswer = da
                //                    gameModel.addAnswerToList(answer: da)
                //                }
                Text("da")
            default: Text("Something went wrong.")
            }
        default: Text("de umpluturra")
        }
    }
    
    struct GameBottomView_Previews: PreviewProvider {
        static var previews: some View {
            GameBottomView()
                .environmentObject(GameModel(quiz: QuizData.Geography.capitals1()))
                .preferredColorScheme(.dark)
        }
    }
}

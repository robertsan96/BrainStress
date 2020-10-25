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
            switch gameModel.gameState {
            case .end:
                GameEndView()
            default:
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
                                    .frame(height: 30)
                            })
                        }
                        .padding()
                        GameTopQuizItemScroller()
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color("Dark4"))
                        HStack {
                            Spacer()
                            Text("\(gameModel.timeRemainingForHumans())")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color("SubtitleColor"))
                        }
                        .padding()
                        VStack {
                            HStack {
                                Text(gameModel.quizItem?.text ?? "")
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 21, weight: .bold, design: .rounded))
                                Spacer()
                            }
                        }
                        .padding([.leading, .trailing, .bottom])
                    }
                    .frame(maxWidth: .infinity)
                    Spacer()
                    VStack {
                        ForEach(gameModel.quizItem?.answer.mergeShuffle ?? [], id:\.self) { item in
                            QuizAnswerButton(action: {
                                gameModel.addAnswerToList(answer: item)
                            }, title: item)
                        }
                    }
                    .padding()
                }
                
            }
        }
        .navigationBarHidden(true)
    }
}

struct GameView_Previews: PreviewProvider {
    
    struct PreviewWrapper: View {
        
        @EnvironmentObject var gameModel: GameModel
        
        var body: some View {
            GameView()
                .environmentObject(gameModel)
                .preferredColorScheme(.dark)
                .onAppear() {
                    gameModel.timeRemainingFoWarmUp = 0
                    gameModel.startGame()
                }
        }
    }
    
    static var previews: some View {
        NavigationView {
            PreviewWrapper()
                .environmentObject(GameModel(quiz: QuizData.Geography.capitals1()))
        }
    }
}

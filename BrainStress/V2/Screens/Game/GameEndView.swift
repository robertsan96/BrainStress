//
//  GameEndView.swift
//  BrainStress
//
//  Created by Robert Sandru on 25/10/2020.
//

import SwiftUI

struct GameEndView: View {
    
    @EnvironmentObject var gameModel: GameModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Bg1"))
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    HStack {
                        Text("Results")
                            .font(.system(size: 25, weight: .semibold, design: .rounded))
                        Spacer()
                        NavigationLink(
                            destination: HomeView(),
                            label: {
                                Image(systemName: "xmark.circle.fill")
                                    .resizable()
                                    .frame(width: 30)
                                    .frame(height: 30)
                                    .foregroundColor(Color("AccentColor"))
                            })
                    }
                    .padding()
                    
                    VStack {
                        HStack {
                            switch gameModel.gameState {
                            case .end(let win):
                                Text(win ? "Passed" : "Failed")
                                    .font(.system(size: 21, weight: .bold, design: .rounded))
                                    .foregroundColor(win ? Color.green : Color.red)
                            default:
                                Text("Hmm.")
                                    .font(.system(size: 21, weight: .bold, design: .rounded))
                            }
                            Spacer()
                        }
                        HStack {
                            Text("Correct Answers: \(gameModel.quizItemsSolved.count)")
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                            Spacer()
                        }
                        HStack {
                            Text("Wrong Answers: \(gameModel.quizItemsFailed.count)")
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                            Spacer()
                        }
                    }
                    .padding([.leading, .trailing, .bottom])
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color("Dark4"))
                }
                Spacer()
                ScrollView {
                    VStack {
                        ForEach(gameModel.originalQuiz.items, id:\.self) { (item: QuizItem) in
                            CardWithSidebarView(minHeight: 100) {
                                CardQuizVerdict(correct: gameModel.quizItemsSolved.contains(item))
                            } rightContent: {
                                VStack(alignment: .leading) {
                                    Text(item.text)
                                        .font(.system(size: 18, weight: .bold, design: .rounded))
                                    Spacer()
                                    Text(item.answer.answer.first ?? "")
                                        .foregroundColor(Color("AccentColor"))
                                        .font(.system(size: 18, weight: .bold, design: .rounded))
                                }
                                .padding()
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct GameEndView_Previews: PreviewProvider {
    static var previews: some View {
        GameEndView()
            .environmentObject(GameModel(quiz: QuizData.Geography().capitals1()))
            .preferredColorScheme(.dark)
    }
}

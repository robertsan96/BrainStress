//
//  Card1StressFactors.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import SwiftUI

struct Card1StressFactors: View {
    
    @State var quiz: Quiz
    
    @State var refreshSignal: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Text("About")
                    .font(.custom("Marker Felt", size: 16))
                Text(String(refreshSignal)).opacity(0)
            }
            .padding([.leading, .top, .trailing], 20)
            .padding(.bottom, 5)
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack {
                    VStack(spacing: 5) {
                        Image(systemName: "timer")
                        Text(String(quiz.getTime().clean))
                            .font(.custom("Marker Felt", size: 12))
                    }
                    Card1StressFactorsDelimiter()
                    VStack(spacing: 5) {
                        Image(systemName: "questionmark.circle")
                        Text(String(quiz.items.count))
                            .font(.custom("Marker Felt", size: 12))
                    }
                    Card1StressFactorsDelimiter()
                    VStack(spacing: 5) {
                        Image(systemName: "gamecontroller.fill")
                        Text(String(UserDefaultsManager.shared.getPlays(quizId: quiz.id)))
                            .font(.custom("Marker Felt", size: 12))
                    }
                    Group {
                        Card1StressFactorsDelimiter()
                        VStack(spacing: 5) {
                            Text("Difficulty")
                                .modifier(BrainStressFont(size: 16))
                            Text(String(quiz.difficulty.rawValue))
                                .font(.custom("Marker Felt", size: 12))
                        }
                        Card1StressFactorsDelimiter()
                        VStack(spacing: 5) {
                            Text("Wins")
                                .modifier(BrainStressFont(color: Color.green, size: 16))
                            Text(String(UserDefaultsManager.shared.getWins(quizId: quiz.id)))
                                .font(.custom("Marker Felt", size: 12))
                        }
                        Card1StressFactorsDelimiter()
                        VStack(spacing: 5) {
                            Text("Fails")
                                .modifier(BrainStressFont(color: Color.red, size: 16))
                            Text(String(UserDefaultsManager.shared.getFails(quizId: quiz.id)))
                                .font(.custom("Marker Felt", size: 12))
                        }
                        Spacer()
                    }
                }
            })
            .padding([.leading, .trailing, .bottom], 20)
            .onAppear(perform: {
                refreshSignal = Int.random(in: 0...500)
            })
        }
    }
}

struct Card1StressFactors_Previews: PreviewProvider {
    static var previews: some View {
        Card1StressFactors(quiz: QuizData.Math.addition1())
    }
}

struct Card1StressFactorsDelimiter: View {
    var body: some View {
        Rectangle()
            .frame(width: 1, height: 20)
            .foregroundColor(Color.gray.opacity(0.4))
            .padding(2)
    }
}

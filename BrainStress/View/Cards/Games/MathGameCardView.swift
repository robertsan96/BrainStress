//
//  MathGameCardView.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import SwiftUI

struct MathGameCardView: View {
    
    @State var readyToNavigate: Bool = false
    @State var quiz: Quiz = QuizData.Math.addition1()
    
    @State var gameModel: GameModel?
    
    var body: some View {
        ZStack {
            VStack {
                Card1Header(title: quiz.title, description: quiz.description)
                Spacer()
                HStack {
                    Card1StressFactors(quiz: quiz)
                    VStack {
                        NavigationLink(
                            destination: GameView()
                                .environmentObject(gameModel ?? GameModel(quiz: quiz)),
                            isActive: $readyToNavigate,
                            label: {
                                RoundedButton1(enabled: .constant(true),
                                               title: "Play",
                                               fontSize: 24,
                                               padding: 15,
                                               width: 20,
                                               height: 15,
                                               cornerRadius: 60)
                            })
                            .simultaneousGesture(TapGesture().onEnded({ _ in
                                gameModel = GameModel(quiz: quiz)
                                readyToNavigate = true
                            }))
                    }.padding()
                }
                .background(Color.tertiarySystemGroupedBackground)
                
            }
            .frame(height: 350)
            .background(Card1(overlay: false,
                              primaryColor: Color.black,
                              secondaryColor: Color.pink,
                              backgroundSymbolColor: Color.pink.opacity(0.2)))
            .cornerRadius(15)
            .padding()
        }
    }
}

struct MathGameCardView_Previews: PreviewProvider {
    static var previews: some View {
        MathGameCardView(quiz: QuizData.Math.dummyLevel())
            .preferredColorScheme(.light)
    }
}

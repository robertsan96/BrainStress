//
//  GameEndView.swift
//  BrainStress
//
//  Created by Robert Sandru on 08/10/2020.
//

import SwiftUI

struct GameEndView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var gameModel: GameModel
    
    @State var celebrateAnimationRunning: Bool = false
    
    var body: some View {
        VStack {
            LogoView()
                .frame(maxHeight: 200)
            Spacer()
            switch gameModel.gameState {
            case .end(let won):
                if won {
                    Text("Winner\nWinner")
                        .multilineTextAlignment(.center)
                        .modifier(BrainStressFont(color: .pink, size: 42))
                        .scaleEffect(celebrateAnimationRunning ? 1 : 0)
                        .animation(.linear(duration: 0.2))
                        .onAppear() {
                            celebrateAnimationRunning = true
                        }
                    Text("CHICKEN\nDINNER")
                        .multilineTextAlignment(.center)
                        .modifier(BrainStressFont(size: 52))
                        .scaleEffect(celebrateAnimationRunning ? 1 : 0)
                        .animation(.linear(duration: 0.3))
                    Spacer()
                    Text(QuizMessageData
                                    .EndingMessages
                                    .winningMessages()
                                    .randomElement()!)
                        .multilineTextAlignment(.center)
                        .modifier(BrainStressFont(size: 24))
                        .scaleEffect(celebrateAnimationRunning ? 1 : 0)
                        .animation(.linear(duration: 0.3))
                } else {
                    Text("Oops\n:(")
                        .multilineTextAlignment(.center)
                        .modifier(BrainStressFont(color: .pink, size: 48))
                        .scaleEffect(celebrateAnimationRunning ? 1 : 0)
                        .animation(.linear(duration: 0.2))
                        .onAppear() {
                            celebrateAnimationRunning = true
                        }
                    Text("FAILED\n")
                        .multilineTextAlignment(.center)
                        .modifier(BrainStressFont(size: 68))
                        .scaleEffect(celebrateAnimationRunning ? 1 : 0)
                        .animation(.linear(duration: 0.1))
                    Text(QuizMessageData
                            .EndingMessages
                            .failingMessages()
                            .randomElement()!)
                        .multilineTextAlignment(.center)
                        .modifier(BrainStressFont(size: 24))
                        .animation(.linear(duration: 0.3))
                }
                Spacer()
                Text("\(gameModel.quizItemsSolved.count) SOLVED")
                    .modifier(BrainStressFont(color: Color.green))
                Text("\(gameModel.quizItemsFailed.count) FAILED")
                    .modifier(BrainStressFont(color: Color.red))
                Spacer()
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        RoundedButton1(enabled: .constant(true), title: "Home")
                    })
                }
                Spacer()
            default: Text("")
            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .navigationBarHidden(true)
    }
}

struct GameEndView_Previews: PreviewProvider {
    static var previews: some View {
        GameEndView()
            .environmentObject(GameModel(quiz: QuizData.Math.dummyLevel()))
            .preferredColorScheme(.dark)
    }
}

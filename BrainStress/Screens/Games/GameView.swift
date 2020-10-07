//
//  GameView.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        ZStack {
            BackgroundView().edgesIgnoringSafeArea(.all)
            VStack {
                if viewModel.gameState == .showingCorrectAnswer {
                    Text("AI NIMERITOOOOO")
                        .font(.custom("Marker Felt", size: 56))
                }
                if viewModel.gameState == .showingFailedAnswer {
                        Text("AI de plm")
                            .font(.custom("Marker Felt", size: 56))

                }
                if viewModel.gameState == .won {
                    Text("Hoooray! You won!")
                } else if viewModel.gameState == .failed {
                    Text("Looooser!!!")
                } else {
                    GameTopView(timeRemaining: $viewModel.runningTimeRemaining,
                                gameState: $viewModel.gameState)
                    Spacer()
                    Spacer()
                    GameQuestionView(text: .constant(viewModel.activeQuizItem?.text ?? ""))
                    Spacer()
                    VStack {
                        TextField("Your Answer",
                                  text: $viewModel.userAnswer) { _ in }
                            onCommit: {
                                viewModel.userCommitAnswer()
                            }
                            
                            .font(.custom("Marker Felt", size: 24))
                            .multilineTextAlignment(.center)
                            .frame(height: 60)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color.pink)
                        
                        
                    }.padding()
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel()).preferredColorScheme(.dark)
    }
}

struct GameTopView: View {
    
    @Binding var timeRemaining: Int
    @Binding var gameState: GameViewModel.GameState
    
    var body: some View {
        HStack {
            Image(systemName: "xmark")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.pink)
            Button(action: {
                switch gameState {
                case .pause: gameState = .running
                case .running: gameState = .pause
                default: break
                }
            }, label: {
                Image(systemName: (gameState == .pause) ? "play.fill" : "pause.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.pink)
            })
            Spacer()
            Text("\(timeRemaining)")
                .font(.custom("Marker Felt", size: 24))
                .foregroundColor(Color.pink)
                .animation(.linear)
            Image(systemName: "timer")
                .foregroundColor(timeRemaining > 0 ? Color.white : Color.pink)
        }.padding()
    }
}

struct GameQuestionView: View {
    
    @Binding var text: String?
    
    var body: some View {
        Text("\(text ?? "")")
            .font(.custom("Marker Felt", size: 36))
            .animation(.easeInOut)
    }
}

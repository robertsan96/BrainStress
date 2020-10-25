//
//  WarmupView.swift
//  BrainStress
//
//  Created by Robert Sandru on 24/10/2020.
//

import SwiftUI

struct WarmupView: View {
    
    @ObservedObject var gameModel: GameModel
    
    @State var shouldNavigate: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color("Bg1"))
            VStack {
                Spacer()
                Text(gameModel.quiz.title)
                    .multilineTextAlignment(.center)
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
                NavigationLink(
                    destination: GameView().environmentObject(gameModel),
                    isActive: gameModel.timeRemainingFoWarmUp == 0 ?
                        .constant(true) :
                        $shouldNavigate,
                    label: {
                        Button1(enabled: .constant(true), title: "Skip")
                    })
                    .frame(width: 200, height: 70)
                    .simultaneousGesture(TapGesture().onEnded({ _ in
                        shouldNavigate = true
                        gameModel.timeRemainingFoWarmUp = 0
                    }))
                Spacer()
                Text(gameModel.quiz.description)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16, weight: .light, design: .rounded))
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .navigationBarHidden(true)
        .onAppear() {
            gameModel.startGame()
        }
    }
}

struct WarmupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WarmupView(gameModel: GameModel(quiz: QuizData.Math.addition1()))
                .preferredColorScheme(.dark)
                .navigationBarHidden(true)
        }
    }
}

//
//  GameView.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var gameModel: GameModel
    
    var body: some View {
        ZStack {
            BackgroundView().edgesIgnoringSafeArea(.all)
            switch gameModel.gameState {
            case .warmUp: GameWarmUpView()
            case .playing, .paused:
                VStack {
                    GameTopView()
                    Spacer()
                    GameMidView()
                    GameBottomView()
                }
            default: Text("Ok dk")
            }
        }
    }
}

struct GameMode_Previews: PreviewProvider {
        
    static var previews: some View {
        GameView()
            .preferredColorScheme(.dark)
            .environmentObject(GameModel(quiz: QuizData.Math.dummyLevel()))
    }
}

struct GameTopView: View {
    
    @EnvironmentObject var gameModel: GameModel
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // close
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.pink)
                })
                Spacer()
                Text("0:20")
                    .font(.custom("Marker Felt", size: 28))
                    .foregroundColor(Color.pink)
            }.padding()
        }
    }
}

struct GameMidView: View {
    
    @EnvironmentObject var gameModel: GameModel
    
    var body: some View {
        VStack {
            Text("\(gameModel.timeRemainingFoWarmUp)")
        }
    }
}

struct GameBottomView: View {
    
    @EnvironmentObject var gameModel: GameModel
    
    var body: some View {
        Text("Bottom")
    }
}

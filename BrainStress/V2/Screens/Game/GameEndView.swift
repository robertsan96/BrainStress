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
                        Button(action: {}, label: {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .frame(width: 30)
                                .frame(height: 30)
                        })
                    }
                    .padding()
                }
                Spacer()
                ScrollView {
                    VStack {
                        ForEach(gameModel.originalQuiz.items, id:\.self) { item in
                            CardWithSidebarView {
                                CardQuizLeft()
                            } rightContent: {
                                VStack {
                                    Text(item.text)
                                        .font(.system(size: 18, weight: .bold, design: .rounded))
                                    Spacer()
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct GameEndView_Previews: PreviewProvider {
    static var previews: some View {
        GameEndView()
            .environmentObject(GameModel(quiz: QuizData.Geography.capitals1()))
            .preferredColorScheme(.dark)
    }
}

//
//  CardQuizLeft.swift
//  BrainStress
//
//  Created by Robert Sandru on 21/10/2020.
//

import SwiftUI

struct CardQuizLeft: View {
    
    @State var quiz: Quiz
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("AccentColor"))
                .frame(width: 50)
            VStack(spacing: 15) {
                VStack(spacing: 0) {
                    Image(systemName: "timer")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.white)
                    Text("\(quiz.getTime().clean)")
                        .font(.system(size: 8,
                                      weight: .light,
                                      design: .rounded))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: 20, maxHeight: 22)
                VStack(spacing: 0) {
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.white)
                    Text(quiz.difficulty.rawValue)
                        .font(.system(size: 8,
                                      weight: .light,
                                      design: .rounded))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: 50, maxHeight: 22)
                VStack(spacing: 0) {
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.white)
                    Text("\(quiz.items.count)")
                        .font(.system(size: 8,
                                      weight: .light,
                                      design: .rounded))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: 50, maxHeight: 22)
            }
        }
    }
}

struct CardQuizLeft_Previews: PreviewProvider {
    static var previews: some View {
        CardQuizLeft(quiz: QuizData.Math().addition1())
    }
}

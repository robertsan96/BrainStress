//
//  QuizAnswerButton.swift
//  BrainStress
//
//  Created by Robert Sandru on 25/10/2020.
//

import SwiftUI

struct QuizAnswerButton: View {
    
    @State var action: () -> Void
    @State var title: String
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            VStack {
                Text(title)
                    .foregroundColor(Color("TextColor"))
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("AnswerBorderColor"), lineWidth: 2)
            )
        })
        .padding(.bottom, 10)
    }
}

struct QuizAnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        QuizAnswerButton(action: {
        }, title: "Click")
    }
}

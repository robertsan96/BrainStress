//
//  MathGameView.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import SwiftUI

struct GameView: View {
    
    @State var answer: String = ""
    
    var body: some View {
        ZStack {
            BackgroundView().edgesIgnoringSafeArea(.all)
            VStack {
                QuizTopBar()
                Spacer()
                Text("24 + 25 = ?")
                    .font(.custom("Marker Felt", size: 36))
                Spacer()
                VStack {
                    
                    TextField("0", text: $answer)
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

struct MathGameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().preferredColorScheme(.dark)
    }
}

struct QuizTopBar: View {
    var body: some View {
        HStack {
            Image(systemName: "xmark")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.pink)
            Spacer()
            Text("00:05")
                .font(.custom("Marker Felt", size: 24))
                .foregroundColor(Color.pink)
        }.padding()
    }
}

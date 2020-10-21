//
//  CardView.swift
//  BrainStress
//
//  Created by Robert Sandru on 21/10/2020.
//

import SwiftUI

struct CardView: View {
    
    @State var config: CardPresentable
    
    var body: some View {
        ZStack {
            Image(config.imageName ?? "")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(
                    Rectangle()
                        .foregroundColor(Color(config.overlayColor ?? "").opacity(0.9))
                )
                .cornerRadius(15)
            VStack {
                Spacer()
                HStack {
                    Text(config.name)
                        .font(.system(size: 16, weight: .heavy, design: .rounded))
                    Spacer()
                }
            }
            .padding()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView(config: QuizCategory.math.category())
                .frame(maxWidth: .infinity)
                .frame(height: 90)
        }.previewLayout(.fixed(width: 200, height: 90))
    }
}

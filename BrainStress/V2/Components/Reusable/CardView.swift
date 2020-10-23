//
//  CardView.swift
//  BrainStress
//
//  Created by Robert Sandru on 21/10/2020.
//

import SwiftUI

struct CardView: View {
    
    @Binding var active: Bool
    @State var config: CardPresentable
    
    var body: some View {
        ZStack {
            Image(config.imageName ?? "")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(
                    Rectangle()
                        .foregroundColor(Color(config.overlayColor ?? "")
                                            .opacity(0.9))
                        .overlay(active ? Color.clear : Color.black.opacity(0.8))
                )
                .cornerRadius(15)
            VStack {
                Spacer()
                HStack {
                    Text(config.name)
                        .font(.system(size: 16, weight: .heavy, design: .rounded))
                        .foregroundColor(Color(config.textColor ?? "TextColor"))
                    Spacer()
                }
            }
            .padding()
        }
        .opacity(active ? 1 : 0.8)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView(active: .constant(true),
                     config: QuizCategory.math.category())
                .frame(maxWidth: .infinity)
                .frame(height: 90)
        }.previewLayout(.fixed(width: 200, height: 90))
    }
}

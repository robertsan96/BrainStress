//
//  FirstTimeOne.swift
//  BrainStress
//
//  Created by Robert Sandru on 20/10/2020.
//

import SwiftUI

struct FirstTimeOne: View {
    var body: some View {
        VStack {
            ZStack {
                GeometryReader { proxy in
                    VStack {
                        VStack {
                            Spacer()
                            Circle()
                                .frame(height: 100)
                                .foregroundColor(Color("Dark1"))
                                .overlay(
                                    Image(systemName: "hands.sparkles.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .scaleEffect(0.5)
                                        .foregroundColor(Color("AccentColor"))
                                )
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .padding()
                        VStack {
                            Text("Hello!")
                                .font(.system(size: 36, design: .rounded))
                                .fontWeight(.thin)
                                .padding()
                            Text("Nice to meet you, \nanonymous!")
                                .font(.system(size: 24, design: .rounded))
                                .fontWeight(.thin)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color("SubtitleColor"))
                        }
                        Spacer()
                        Spacer()
                        Spacer()
                    }.frame(maxWidth: .infinity)
                }
            }
        }
        .background(Color("Bg1"))
    }
}

struct FirstTimeOne_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FirstTimeOne()
                .preferredColorScheme(.dark)
            FirstTimeOne()
                .preferredColorScheme(.light)
        }
    }
}

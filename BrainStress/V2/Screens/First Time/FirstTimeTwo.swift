//
//  FirstTimeTwo.swift
//  BrainStress
//
//  Created by Robert Sandru on 20/10/2020.
//

import SwiftUI

struct FirstTimeTwo: View {
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
                                    Image(systemName: "lock.fill")
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
                            Text("Privacy")
                                .font(.system(size: 36, design: .rounded))
                                .fontWeight(.thin)
                                .padding()
                            Text("As we truly value your privacy,\nwe ask for no accounts in\n" +
                                "order to use Brain Stress!\n\nWe will only need a nickname\n" +
                                "from you for user experience \nfeatures.")
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


struct FirstTimeTwo_Previews: PreviewProvider {
    static var previews: some View {
        FirstTimeTwo()
            .preferredColorScheme(.dark)
    }
}

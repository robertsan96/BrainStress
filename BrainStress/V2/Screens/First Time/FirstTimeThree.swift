//
//  FirstTimeThree.swift
//  BrainStress
//
//  Created by Robert Sandru on 20/10/2020.
//

import SwiftUI

struct FirstTimeThree: View {
    
    @State var nickname: String = ""
    @State var canContinue: Bool = false
    
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
                                    Image(systemName: "person.fill")
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
                            Text("Who are you?")
                                .font(.system(size: 36, design: .rounded))
                                .fontWeight(.thin)
                                .padding()
                            Spacer()
                            VStack {
                                TextField("Your name", text: $nickname)
                                    .onChange(of: nickname) { _ in
                                        canContinue = !nickname.isEmpty && (nickname.count >= 4)
                                    }
                                    .foregroundColor(Color("AccentColor"))
                                    .font(.system(size: 21, weight: .bold, design: .rounded))
                                    .multilineTextAlignment(.center)
                                Rectangle()
                                    .frame(height: 1)
                                    .border(Color("AccentColor"), width: 1)
                            }
                            .frame(maxWidth: 300)
                            Spacer()
                            
                            VStack {
                                NavigationLink(
                                    destination: HomeView(),
                                    label: {
                                        Button1(enabled: $canContinue)
                                    })
                                    .disabled(!canContinue)
                                    .simultaneousGesture(TapGesture().onEnded({ tap in
                                        if !canContinue { return }
                                        UserDefaultsManager.shared.set(nickname: nickname)
                                    }))
                            }.frame(width: 150, height: 52)
                            Spacer()
                            Spacer()
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

struct FirstTimeThree_Previews: PreviewProvider {
    static var previews: some View {
        FirstTimeThree()
            .preferredColorScheme(.dark)
    }
}

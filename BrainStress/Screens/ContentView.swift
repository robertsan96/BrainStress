//
//  ContentView.swift
//  BrainStress
//
//  Created by Robert Sandru on 05/10/2020.
//

import SwiftUI

struct ContentView: View {
    
    var nickname = UserDefaultsManager.shared.getNickname()
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView().edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    LogoView()
                        .frame(maxHeight: 200)
                    Spacer()
                    NavigationLink(
                        destination: nickname.isEmpty ?
                            AnyView(EnrollView()) :
                            AnyView(MainView(nickname: nickname)),
                        label: {
                            RoundedButton1(enabled: .constant(true), title: "Start")
                        })
                    Spacer()
                    Text("Proudly developed by our brains.\n Have fun!")
                        .foregroundColor(Color.gray.opacity(0.3))
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
            .navigationBarHidden(true)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
            .preferredColorScheme(.dark)
    }
}

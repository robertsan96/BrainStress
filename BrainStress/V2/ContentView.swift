//
//  ContentView.swift
//  BrainStress
//
//  Created by Robert Sandru on 05/10/2020.
//

import SwiftUI
import SwiftUIPager

struct ContentView: View {
    
    var nickname = UserDefaultsManager.shared.getNickname()

    var body: some View {
        NavigationView {
            if nickname.isEmpty {
                FirstTimeView()
            } else {
                HomeView()
            }
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

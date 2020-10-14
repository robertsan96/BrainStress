//
//  MainView.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import SwiftUI

struct MainView: View {
    
    var nickname = UserDefaultsManager.shared.getNickname()
    
    var body: some View {
//        TabView {
            HomeView()
                .navigationBarHidden(true)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Sweet Home")
                }
//            ZStack {
//                BackgroundView().edgesIgnoringSafeArea(.all)
//                VStack {
//                    LogoView()
//                    Spacer()
//                    Text("Scores")
//                }
//            }
//            .navigationBarHidden(true)
//            .tabItem {
//                Image(systemName: "chart.bar.fill")
//                Text("Scores")
//            }
//            ZStack {
//                BackgroundView().edgesIgnoringSafeArea(.all)
//                VStack {
//                    LogoView()
//
//                    Spacer()
//                    Text("Settings")
//                }
//            }
//            .navigationBarHidden(true)
//            .tabItem {
//                Image(systemName: "gear")
//                Text("Settings")
//            }
//        }.accentColor(Color.pink)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView(nickname: "Robert")
                .preferredColorScheme(.dark)
        }
    }
}

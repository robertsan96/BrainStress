//
//  HomeView.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import SwiftUI

struct HomeView: View {
    
    var nickname = UserDefaultsManager.shared.getNickname()
    
    @State var activeCategory = "All"
    
    var body: some View {
        TabView {
            ZStack {
                BackgroundView().edgesIgnoringSafeArea(.all)
                VStack {
                    LogoView()
                    
                    CategoryScroller(activeCategory: $activeCategory)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack {
                            HStack {
                                Text("Maths")
                                    .font(.custom("Marker Felt", size: 36))
                                    .foregroundColor(Color.white)
                                Spacer()
                            }
                            .padding()
                            HStack {
                                Text("Frustration guarateed.")
                                    .foregroundColor(Color.white)
                                    .font(.custom("Marker Felt", size: 24))
                                Spacer()
                            }
                            .padding([.leading, .trailing], 20)
                            Spacer()
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Stress factors:")
                                        .font(.custom("Marker Felt", size: 16))
                                        .padding([.leading, .top, .trailing], 20)
                                        .padding(.bottom, 5)
                                    HStack {
                                        VStack(spacing: 5) {
                                            Image(systemName: "timer")
                                            Text("Timer")
                                                .font(.custom("Marker Felt", size: 16))
                                        }
                                        VStack(spacing: 5) {
                                            Text("165")
                                                .font(.custom("Marker Felt", size: 16))
                                            Text("Questions")
                                                .font(.custom("Marker Felt", size: 16))
                                        }
                                        Spacer()
                                    }.padding([.leading, .trailing, .bottom], 20)
                                }
                                VStack {
                                    RoundedButton1(enabled: .constant(true),
                                                   title: "Play",
                                                   fontSize: 24,
                                                   padding: 15,
                                                   width: 20,
                                                   height: 15,
                                                   cornerRadius: 60)
                                }.padding()
                            }
                            .background(Color.tertiarySystemGroupedBackground)
                            
                        }
                        .frame(height: 350)
                        .background(ShapeCard(overlay: false,
                                              primaryColor: Color.black,
                                              secondaryColor: Color.pink,
                                              backgroundSymbolColor: Color.pink.opacity(0.2)))
                        .cornerRadius(15)
                        .padding()
                        
                    }
                }
            }
            .navigationBarHidden(true)
            .tabItem {
                Image(systemName: "house.fill")
                Text("Sweet Home")
            }
            ZStack {
                BackgroundView().edgesIgnoringSafeArea(.all)
                VStack {
                    LogoView()
                    Spacer()
                    Text("Scores")
                }
            }
            .navigationBarHidden(true)
            .tabItem {
                Image(systemName: "chart.bar.fill")
                Text("Scores")
            }
            ZStack {
                BackgroundView().edgesIgnoringSafeArea(.all)
                VStack {
                    LogoView()
                    Spacer()
                    Text("Settings")
                }
            }
            .navigationBarHidden(true)
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
        }.accentColor(Color.pink)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView(nickname: "Robert")
                .preferredColorScheme(.dark)
        }
    }
}

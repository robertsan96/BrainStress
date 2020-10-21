//
//  FirstTimeView.swift
//  BrainStress
//
//  Created by Robert Sandru on 20/10/2020.
//

import SwiftUI

struct FirstTimeView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(Color("Bg1"))
                GeometryReader { proxy in
                    TabView {
                        FirstTimeOne()
                        FirstTimeTwo()
                        FirstTimeThree()
                    }
                    .background(Color("Bg1"))
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct FirstTimeView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTimeView()
            .preferredColorScheme(.dark)
    }
}

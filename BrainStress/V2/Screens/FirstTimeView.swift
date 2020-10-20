//
//  FirstTimeView.swift
//  BrainStress
//
//  Created by Robert Sandru on 20/10/2020.
//

import SwiftUI

struct FirstTimeView: View {
    
    var body: some View {
        ZStack {
            
            GeometryReader { proxy in
                TabView {
                    FirstTimeOne()
                        .cornerRadius(1)
                        .padding(.top, -44)
                    FirstTimeTwo()
                        .cornerRadius(1)
                        .padding(.top, -44)
                    FirstTimeThree()
                        .cornerRadius(1)
                        .padding(.top, -44)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct FirstTimeView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTimeView()
            .preferredColorScheme(.dark)
    }
}

//
//  FirstTimeThree.swift
//  BrainStress
//
//  Created by Robert Sandru on 20/10/2020.
//

import SwiftUI

struct FirstTimeThree: View {
    var body: some View {
        VStack {
            ZStack {
                GeometryReader { proxy in
                    Image("bg3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .frame(maxWidth: proxy.size.width,
                               maxHeight: proxy.size.height)
                }
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(Color.black)
                    .opacity(0.6)
                GeometryReader { proxy in
                    VStack {
                        VStack {}.frame(height: 100)
                        VStack {
                            Text("Who are you?")
                                .font(.system(size: 48, design: .rounded))
                                .fontWeight(.thin)
                                .foregroundColor(Color.white)
                                .padding()
                        }
                        Spacer()
                        PageDotsView(dots: 3, activeDot: 3)
                            .padding(.bottom, 50)
                    }.frame(maxWidth: .infinity)
                }
            }
        }
    }
}

struct FirstTimeThree_Previews: PreviewProvider {
    static var previews: some View {
        FirstTimeThree()
    }
}

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
                    Image("bg1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all).frame(maxWidth: proxy.size.width,
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
                            Text("Hello!")
                                .font(.system(size: 48, design: .rounded))
                                .fontWeight(.thin)
                                .foregroundColor(Color.white)
                                .padding()
                            Text("Nice to meet you, \nanonymous!")
                                .font(.system(size: 24, design: .rounded))
                                .fontWeight(.thin)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color("SubtitleColor"))
                        }
                        Spacer()
                        PageDotsView(dots: 3, activeDot: 1)
                            .padding(.bottom, 50)
                    }.frame(maxWidth: .infinity)
                }
            }
        }
    }
}

struct FirstTimeOne_Previews: PreviewProvider {
    static var previews: some View {
        FirstTimeOne()
    }
}

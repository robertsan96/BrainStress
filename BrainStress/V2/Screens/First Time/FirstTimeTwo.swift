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
                    Image("bg2")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(maxWidth: proxy.size.width,
                               maxHeight: proxy.size.height)
                }
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(Color.black)
                    .opacity(0.8)
                GeometryReader { proxy in
                    VStack {
                        VStack {}.frame(height: 100)
                        VStack {
                            Text("Nickname")
                                .font(.system(size: 48, design: .rounded))
                                .fontWeight(.thin)
                                .foregroundColor(Color.white)
                                .padding()
                            Text("As we truly value your privacy,\n" +
                                    "we ask for no accounts in\norder to use Brain Stress!\n\n" +
                                    "We will only need a nickname\nfrom you for user experience\n" +
                                    "features.")
                                .font(.system(size: 24, design: .rounded))
                                .fontWeight(.thin)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color("SubtitleColor"))
                        }
                        Spacer()
                        PageDotsView(dots: 3, activeDot: 2)
                            .padding(.bottom, 50)
                    }.frame(maxWidth: .infinity)
                }
                
            }
        }
    }
}

struct FirstTimeTwo_Previews: PreviewProvider {
    static var previews: some View {
        FirstTimeTwo()
    }
}

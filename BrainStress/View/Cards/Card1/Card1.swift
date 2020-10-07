//
//  Card1.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import SwiftUI

struct Card1: View {
    
    var srAxisX = CGFloat(Int.random(in: 50...100))
    var srAxisY = CGFloat(Int.random(in: 200...300))
    
    var overlay = true
    
    var primaryColor = Color.pomegranate
    var secondaryColor = Color.alizarin
    var backgroundSymbolColor = Color.white.opacity(0.5)
    
    var body: some View {
        GeometryReader { (proxy: GeometryProxy) in
            ZStack {
                Rectangle()
                    .foregroundColor(primaryColor)
                BackgroundView(justSymbols: true,
                               symbolColor: backgroundSymbolColor)
                Rectangle()
                    .foregroundColor(secondaryColor)
                    .rotationEffect(.degrees(100))
                    .scaleEffect(0.8)
                    .position(CGPoint(x: proxy.size.width/2 + srAxisX,
                                      y: proxy.size.height/2 - srAxisY))
                Rectangle()
                    .frame(width: proxy.size.width/3, height: proxy.size.height / 3)
                    .foregroundColor(secondaryColor)
                    .clipShape(Circle())
                    .rotationEffect(.degrees(100))
                    .scaleEffect(0.8)
                    .position(CGPoint(x: 0 + srAxisX,
                                      y: proxy.size.height - srAxisY/2))
                
                if overlay {
                    Rectangle()
                        .opacity(0.2)
                }
            }
        }
    }
}

struct ShapeCard_Previews: PreviewProvider {
    static var previews: some View {
        Card1().previewLayout(.fixed(width: 400, height: 400))
    }
}

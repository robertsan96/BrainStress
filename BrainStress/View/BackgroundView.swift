//
//  BackgroundView.swift
//  BrainStress
//
//  Created by Robert Sandru on 05/10/2020.
//

import SwiftUI

struct BackgroundView: View {
    
    var backgroundIcons = [
        "lightbulb.fill",
        "lightbulb",
        "gamecontroller",
        "xmark",
        "cloud.fill",
        "cloud.rain",
        "headphones",
        "play",
        "network",
        "eyes.inverse",
        "mustache",
        "hand.thumbsup.fill",
        "rhombus",
        "pencil",
        "paintbrush.pointed.fill",
        "lasso",
        "slider.horizontal.3",
        "perspective",
        "tortoise.fill",
        "ant.circle.fill",
        "flame",
        "leaf.fill",
        "hare",
        "bubble.middle.bottom.fill",
        "timer",
        "clock",
        "plus",
        "minus.square",
        "sum",
        "percent",
        "lessthan",
        "multiply",
        "x.squareroot",
        "questionmark",
        "questionmark.diamond",
        "questionmark.folder",
        "person.fill.questionmark",
        "questionmark.square.dashed"
    ]
    
    var backgroundWords = [
        "Love",
        "Action",
        "Did you",
        "Fun",
        "Today",
        "Yes",
        "Phoenix",
        "Romania",
        "Brain",
        "No",
        "iOS",
        "Timisoara",
        "Lore",
        "Robert"
    ]
    
    var justSymbols = false
    var symbolColor = Color.gray.opacity(0.2)
    @State var pulsating = false
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Rectangle()
                    .foregroundColor(justSymbols ? Color.clear : Color.gray)
                    .opacity(0.2)
                VStack {
                    ForEach(0 ..< 5) { item in
                        Spacer()
                        HStack(spacing: CGFloat(Int.random(in: 0...4))) {
                            ForEach(0 ..< Int.random(in: 0...4), id:\.self) { index in
                                if index%2 == Int.random(in: 0...1) {
                                    Image(systemName: backgroundIcons.randomElement()!)
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(symbolColor)
                                        .frame(height: 10 + CGFloat(Int.random(in: 0...30)))
                                        .padding()
                                } else {
                                    Text(backgroundWords.randomElement()!)
                                        .font(.custom("", size: 4))
                                        .foregroundColor(symbolColor)
                                }
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: proxy.size.width, maxHeight: proxy.size.height)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}

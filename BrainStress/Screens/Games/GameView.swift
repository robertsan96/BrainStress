//
//  GameView.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import SwiftUI

struct GameView: View {
    
    @State var answer: String = ""
    
    @State var timerDidEnd = false
    
    var body: some View {
        ZStack {
            BackgroundView().edgesIgnoringSafeArea(.all)
            VStack {
                Text("\(String(timerDidEnd)) da")
                GameTopView(timeRemaining: 5, timerDidEnd: $timerDidEnd)
                Spacer()
                Text("24 + 25 = ?")
                    .font(.custom("Marker Felt", size: 36))
                Spacer()
                VStack {
                    
                    TextField("0", text: $answer)
                        .font(.custom("Marker Felt", size: 24))
                        .multilineTextAlignment(.center)
                        .frame(height: 60)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.pink)
                }.padding()
                Spacer()
                Spacer()
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().preferredColorScheme(.dark)
    }
}

struct GameTopView: View {
    
    @State var timeRemaining = 5
    @Binding var timerDidEnd: Bool
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            Image(systemName: "xmark")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.pink)
            Spacer()
            Text("\(timeRemaining)")
                .font(.custom("Marker Felt", size: 24))
                .foregroundColor(Color.pink)
                .onReceive(timer, perform: { input in
                    if self.timeRemaining > 1 {
                        self.timeRemaining -= 1
                    } else {
                        self.timeRemaining = 0
                        timerDidEnd = true
                    }
                })
            Image(systemName: "timer")
                .foregroundColor(timeRemaining > 0 ? Color.white : Color.pink)
        }.padding()
    }
}

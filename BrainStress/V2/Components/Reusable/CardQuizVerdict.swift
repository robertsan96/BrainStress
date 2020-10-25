//
//  CardQuizVerdict.swift
//  BrainStress
//
//  Created by Robert Sandru on 25/10/2020.
//

import SwiftUI

struct CardQuizVerdict: View {
    
    @State var correct = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(correct ? Color.green : Color("AccentColor"))
                .frame(width: 50)
            VStack {
                Text(correct ? "C" : "F")
                    .foregroundColor(Color.white)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
            }
        }
    }
}

struct CardQuizVerdict_Previews: PreviewProvider {
    static var previews: some View {
        CardQuizVerdict()
    }
}

//
//  Button1.swift
//  BrainStress
//
//  Created by Robert Sandru on 21/10/2020.
//

import SwiftUI

struct Button1: View {
    
    @Binding var enabled: Bool
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color("AccentColor"))
                .cornerRadius(15)
                .overlay(
                    Text("Play")
                        .font(.system(size: 24,
                                      weight: .bold,
                                      design: .rounded))
                        .foregroundColor(Color.white)
                )
        }.opacity(enabled ? 1 : 0.6)
    }
}

struct Button1_Previews: PreviewProvider {
    static var previews: some View {
        Button1(enabled: .constant(false))
    }
}

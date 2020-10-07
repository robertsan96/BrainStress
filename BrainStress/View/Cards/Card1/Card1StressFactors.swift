//
//  Card1StressFactors.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import SwiftUI

struct Card1StressFactors: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Stress factors:")
                .font(.custom("Marker Felt", size: 16))
                .padding([.leading, .top, .trailing], 20)
                .padding(.bottom, 5)
            HStack {
                VStack(spacing: 5) {
                    Image(systemName: "timer")
                    Text("Timer")
                        .font(.custom("Marker Felt", size: 16))
                }
                VStack(spacing: 5) {
                    Text("165")
                        .font(.custom("Marker Felt", size: 16))
                    Text("Questions")
                        .font(.custom("Marker Felt", size: 16))
                }
                Spacer()
            }.padding([.leading, .trailing, .bottom], 20)
        }
    }
}

struct Card1StressFactors_Previews: PreviewProvider {
    static var previews: some View {
        Card1StressFactors()
    }
}

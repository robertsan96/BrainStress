//
//  Card1Header.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import SwiftUI

struct Card1Header: View {
    var body: some View {
        HStack {
            Text("Maths")
                .font(.custom("Marker Felt", size: 36))
                .foregroundColor(Color.white)
            Spacer()
        }
        .padding()
        HStack {
            Text("Frustration guarateed.")
                .foregroundColor(Color.white)
                .font(.custom("Marker Felt", size: 24))
            Spacer()
        }
        .padding([.leading, .trailing], 20)
    }
}

struct Card1Header_Previews: PreviewProvider {
    static var previews: some View {
        Card1Header()
    }
}

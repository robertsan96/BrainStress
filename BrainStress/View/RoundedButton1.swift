//
//  RoundedButton1.swift
//  BrainStress
//
//  Created by Robert Sandru on 05/10/2020.
//

import SwiftUI

struct RoundedButton1: View {
    
    @Binding var enabled: Bool
    
    var title: String
    var fontSize: CGFloat = 32
    var padding: CGFloat = 25
    var width: CGFloat = 25
    var height: CGFloat = 25
    var cornerRadius: CGFloat = 60

    var body: some View {
        ZStack {
            HStack {
                Text(title)
                    .font(.custom("Marker Felt", size: fontSize))
                    .foregroundColor(Color.white)
                Image(systemName: "arrowshape.turn.up.right.fill")
                    .resizable()
                    .frame(width: width, height: height)
                    .foregroundColor(.white)
            }
        }
        .padding(padding)
        .background(enabled ? Color.pink : Color.pink.opacity(0.5))
        .cornerRadius(cornerRadius)
        .disabled(!enabled)
    }
}
struct RoundedButton1_Previews: PreviewProvider {
    
    static var previews: some View {
        
        RoundedButton1(enabled: .constant(true),
                       title: "Start")
            .previewLayout(.sizeThatFits)
    }
}

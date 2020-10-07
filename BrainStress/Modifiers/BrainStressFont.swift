//
//  BrainStressFont.swift
//  BrainStress
//
//  Created by Robert Sandru on 07/10/2020.
//

import SwiftUI

struct BrainStressFont: ViewModifier {
    
    var color: Color = Color.pink
    var size: CGFloat = 22
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Marker Felt", size: size))
            .foregroundColor(color)
    }
}

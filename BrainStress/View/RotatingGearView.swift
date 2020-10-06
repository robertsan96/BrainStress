//
//  RotatingGearView.swift
//  BrainStress
//
//  Created by Robert Sandru on 05/10/2020.
//

import SwiftUI

struct RotatingGearView: View {
    
    @State var spin = false
    var duration = 1.5
    var color: Color
    
    var body: some View {
        Image(systemName: "gear")
            .resizable()
            .scaledToFill()
            .foregroundColor(color)
            .rotationEffect(.degrees(spin ? 360 : 0))
            .animation(Animation.linear(duration: duration)
                        .repeatForever(autoreverses: false))
            .onAppear() {
                self.spin.toggle()
            }
    }
}

struct RotatingGearView_Previews: PreviewProvider {
    static var previews: some View {
        RotatingGearView(color: Color.gray.opacity(0.4)).previewLayout(.sizeThatFits)
    }
}

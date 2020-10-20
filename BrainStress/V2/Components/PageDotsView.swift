//
//  PageDotsView.swift
//  BrainStress
//
//  Created by Robert Sandru on 20/10/2020.
//

import SwiftUI


struct PageDotsView: View {
    
    @State var dots: Int = 0
    @State var activeDot: Int = 0
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                ForEach(0..<dots) { item in
                    Circle()
                        .strokeBorder(Color("CircleBorderColor"), lineWidth: 1)
                        .background(Circle().foregroundColor( item == activeDot - 1 ? Color("AccentColor") : Color.clear))
                }
            }.frame(maxWidth: 80)
        }
        .frame(height: 40)
    }
}

struct PageDotsView_Previews: PreviewProvider {
    static var previews: some View {
        PageDotsView()
    }
}

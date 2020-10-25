//
//  CardWithSidebarView.swift
//  BrainStress
//
//  Created by Robert Sandru on 22/10/2020.
//

import SwiftUI

struct CardWithSidebarView<LeftContent: View, RightContent: View>: View {
    
    @State var minHeight: CGFloat = 200
    var leftContent: () -> LeftContent
    var rightContent: () -> RightContent
    
    var body: some View {
        
        VStack {
            HStack {
                //                CardQuizLeft()
                leftContent()
                rightContent()
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, minHeight: minHeight)
        .background(Color("Dark2"))
        .cornerRadius(15)
    }
}

struct CardWithSidebarView_Previews: PreviewProvider {
    static var previews: some View {
        CardWithSidebarView(leftContent: {
            Text("left")
        }, rightContent: {
            Text("right")
        })
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 320, height: 200))
    }
}

//
//  KeyView.swift
//  BrainStress
//
//  Created by Robert Sandru on 12/10/2020.
//

import SwiftUI

struct KeyView: View {
    
    var title: String?
    var image: String?
    var backgroundColor: Color = Color.pink
    
    var body: some View {
        VStack {
            if title != nil {
                Text(title!)
                    .modifier(BrainStressFont(color: Color.white, size: 26))
                    .frame(minHeight: 20, maxHeight: 26)
                    .padding()
            }
            if image != nil {
                Image(systemName: image!)
                    .foregroundColor(Color.pink)
                    .frame(maxWidth: 30, minHeight: 20, maxHeight: 26)
                    .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(image == nil ? backgroundColor : Color.clear)
        .border(backgroundColor, width: 3)
        .cornerRadius(5)
    }
}


struct KeyView_Previews: PreviewProvider {
    static var previews: some View {
        KeyView()
    }
}

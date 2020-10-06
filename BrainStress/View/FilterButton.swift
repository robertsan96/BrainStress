//
//  FilterButton.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import SwiftUI

struct FilterButton: View {
    
    var title: String
    var active: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .font(.custom("Marker Felt", size: 24))
                .foregroundColor(Color.tertiarySystemGroupedBackground)
        }
        .padding(10)
        .background(active ? Color.pink.opacity(0.6) : Color.pink)
        .cornerRadius(5)
    }
}


struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        FilterButton(title: "Maths", active: false)
            .previewLayout(.sizeThatFits)
    }
}

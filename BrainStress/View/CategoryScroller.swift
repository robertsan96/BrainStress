//
//  CategoryScroller.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import SwiftUI

struct CategoryScroller: View {
    
    @Binding var activeCategory: String
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button(action: {
                        activeCategory = "All"
                    }, label: {
                        FilterButton(title: "All",
                                     active: activeCategory == "All")
                    })
                    ForEach(Constants.categories) { category in
                        Button(action: {
                            activeCategory = category.name
                        }, label: {
                            FilterButton(title: category.name,
                                         active: activeCategory == category.name)
                        })
                    }
                }
            }
        }
        .padding()
    }
}

struct CategoryScroller_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScroller(activeCategory: .constant("Math")).previewLayout(.sizeThatFits)
    }
}

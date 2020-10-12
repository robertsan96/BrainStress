//
//  HomeView.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import SwiftUI

struct HomeView: View {
    
    @State var activeCategory = "All"
    
    var body: some View {
        ZStack {
            BackgroundView().edgesIgnoringSafeArea(.all)
            VStack {
                LogoView()
                CategoryScroller(activeCategory: $activeCategory)
                
                ScrollView(.vertical, showsIndicators: false) {
                    MathGameCardView(quiz: QuizData.Math.addition1())
                    MathGameCardView(quiz: QuizData.Math.addition2())
                    MathGameCardView(quiz: QuizData.Math.subtraction1())
                    MathGameCardView(quiz: QuizData.Math.subtraction2())
                    
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().preferredColorScheme(.dark)
    }
}

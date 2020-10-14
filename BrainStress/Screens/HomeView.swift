//
//  HomeView.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import SwiftUI

struct HomeView: View {
    
    @State var activeCategory = "All"
    @State var shownQuizzes: [Quiz] = []
    
    var quizzes: [Quiz] = [
        QuizData.Math.addition1(),
        QuizData.Math.addition2(),
        QuizData.Math.addition3(),
        QuizData.Math.addition4(),
        
        QuizData.Math.subtraction1(),
        QuizData.Math.subtraction2(),
        QuizData.Math.subtraction3(),
        QuizData.Math.subtraction4(),
        
        QuizData.Math.multiplications1(),
        QuizData.Math.multiplications2(),
        QuizData.Math.multiplications3(),
        QuizData.Math.multiplications4(),
        
        QuizData.Math.divisions1(),
        QuizData.Math.divisions2(),
        QuizData.Math.divisions3(),
        QuizData.Math.divisions4(),
        
        QuizData.Geography.capitals1(),
        QuizData.Geography.geography1()
    ]
    
    func setShownQuizzes() {
        shownQuizzes = quizzes.filter({ q -> Bool in
            (q.category.rawValue.name == activeCategory) || activeCategory == "All"
        })
    }
    
    var body: some View {
        ZStack {
            BackgroundView().edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                LogoView()
                    .frame(maxHeight: 100)
                CategoryScroller(activeCategory: $activeCategory)
                
                if shownQuizzes.count > 0 {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(shownQuizzes, id: \.self) { sq in
                            MathGameCardView(quiz: sq)
                        }
                    }.zIndex(-1)
                } else {
                    VStack {
                        Spacer()
                        Text("Pure emptiness")
                            .multilineTextAlignment(.center)
                            .modifier(BrainStressFont(color: Color.pink, size: 46))
                        Text("We promise we'll come back with some great content here, too. \n")
                            .modifier(BrainStressFont(size: 22))
                            .multilineTextAlignment(.center)
                            .padding()
                        Text("Promise.")
                            .modifier(BrainStressFont(size: 22))
                            .multilineTextAlignment(.center)
                            .padding()
                        Text("😍")
                            .modifier(BrainStressFont(size: 72))
                            .multilineTextAlignment(.center)
                            .padding()
                        Spacer()
                    }
                    .padding()
                }
            }
        }
        .onChange(of: activeCategory, perform: { _ in
            setShownQuizzes()
        })
        .onAppear(perform: {
            setShownQuizzes()
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().preferredColorScheme(.light)
    }
}

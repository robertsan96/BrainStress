//
//  HomeView.swift
//  BrainStress
//
//  Created by Robert Sandru on 21/10/2020.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color("Bg1"))
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(viewModel.welcomeMessage)
                            .font(.system(size: 32,
                                          weight: .light,
                                          design: .rounded))
                            .multilineTextAlignment(.leading)
                        Text("Robert!")
                            .font(.system(size: 32, weight: .black, design: .rounded))
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 130)
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack {
                        ForEach(viewModel.categories.chunked(into: 2), id:\.self) { set in
                            HStack {
                                ForEach(set, id:\.self) { category in
                                    CardView(config: category)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 90)
                                }
                            }
                        }
                    }.padding()
                })
            }
        }
        .navigationBarHidden(true)
    }
    
    class ViewModel: NSObject, ObservableObject {
        
        var categories = [
            Category(stringLiteral: "All",
                     imageName: "",
                     overlayColor: "CardOverlayAll"),
            
            QuizCategory.math.category(),
            QuizCategory.geography.category(),
            
            QuizCategory.trickyQuestions.category(),
            QuizCategory.automotive.category(),
            
            QuizCategory.motto.category()
        ]
        
        var welcomeMessage: String {
            let hour = Calendar.current.component(.hour, from: Date())
            switch hour {
            case 6..<12: return "Morning,"
            case 12: return "Good day,"
            case 13..<17: return "Good afternoon,"
            case 17..<22: return "Good evening,"
            default: return "Hello,"
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}

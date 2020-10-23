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
                        Text(viewModel.welcomeNickname)
                            .font(.system(size: 32, weight: .black, design: .rounded))
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 130)
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack {
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
                        VStack {
                            HStack {
                                Text("Quizzes")
                                    .font(.system(size: 36, weight: .bold, design: .rounded))
                                Spacer()
                            }
                            ForEach(viewModel.quizzes, id:\.self) { quiz in
                                CardWithSidebarView(leftContent: {
                                    CardQuizLeft()
                                }, rightContent: {
                                    Dedicated_QuizCardInteriorView(quiz: quiz)
                                })
                            }
                        }.padding()
                    }
                })
            }
        }
        .background(Color("Bg1"))
        .navigationBarHidden(true)
    }
    
    class ViewModel: NSObject, ObservableObject {
        
        var categories = [
            Category(withName: "All",
                     withImageName: "",
                     withOverlayColor: "CardOverlayAll"),
            
            QuizCategory.math.category(),
            QuizCategory.geography.category(),
            
            QuizCategory.trickyQuestions.category(),
            QuizCategory.automotive.category(),
            
            QuizCategory.motto.category()
        ]
        
        var quizzes: [Quiz] = [
            QuizData.Math.addition1(),
            QuizData.Math.addition2(),
            QuizData.Math.addition3(),
            QuizData.Math.addition4(),
            
            QuizData.Math.divisions1(),
            QuizData.Math.divisions2(),
            QuizData.Math.divisions3(),
            QuizData.Math.divisions4(),
            
            QuizData.Math.subtraction1(),
            QuizData.Math.subtraction2(),
            QuizData.Math.subtraction3(),
            QuizData.Math.subtraction4(),
            
            QuizData.Math.multiplications1(),
            QuizData.Math.multiplications2(),
            QuizData.Math.multiplications3(),
            QuizData.Math.multiplications4(),
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
        
        var welcomeNickname: String {
            let nickName = UserDefaultsManager.shared.getNickname()
            return nickName.isEmpty ? "Anonymous" : nickName
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
    }
}

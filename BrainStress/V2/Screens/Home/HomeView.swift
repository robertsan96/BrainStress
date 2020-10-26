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
                                        Button(action: {
                                            viewModel.activeCategory = category
                                        }, label: {
                                            CardView(active: .constant(category == viewModel.activeCategory),
                                                     config: category)
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 90)
                                        })
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
                            if viewModel.quizzes.count == 0 {
                                VStack {
                                    Text("Pretty empty here 😐")
                                        .font(.system(size: 16, weight: .light, design: .rounded))
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 250)
                            } else {
                                ForEach(viewModel.quizzes, id:\.self) { quiz in
                                    CardWithSidebarView(leftContent: {
                                        CardQuizLeft()
                                    }, rightContent: {
                                        Dedicated_QuizCardInteriorView(destination: WarmupView(gameModel: GameModel(quiz: quiz)),
                                                                       quiz: quiz)
                                    })
                                }
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
        
        @Published var activeCategory: CategoryModel {
            didSet {
                setQuizzes(byCategory: activeCategory)
            }
        }
        
        var categories = [
            CategoryModel(withName: "All",
                          withImageName: "",
                          withOverlayColor: "CardOverlayAll"),
            
            QuizCategory.math.category(),
            QuizCategory.geography.category(),
            
            QuizCategory.trickyQuestions.category(),
            QuizCategory.automotive.category(),
            
            QuizCategory.motto.category()
        ]
        
        var quizzes = QuizData().quizzes
        
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
        
        override init() {
            activeCategory = categories.first!
            super.init()
            setQuizzes(byCategory: activeCategory)
        }
        
        public func setQuizzes(byCategory category: CategoryModel) {
            quizzes = QuizData().quizzes.filter({ q in
                (q.category.category() == activeCategory) || activeCategory.name == "All"
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .preferredColorScheme(.dark)
                .navigationBarHidden(true)
        }
    }
}

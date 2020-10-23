//
//  Dedicated_QuizCardInteriorView.swift
//  BrainStress
//
//  Created by Robert Sandru on 23/10/2020.
//

import SwiftUI

struct Dedicated_QuizCardInteriorView: View {
    
    @ObservedObject var viewModel = ViewModel()
    @State var quiz: Quiz
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(quiz.title)
                .font(.system(size: 24, weight: .bold, design: .rounded))
            Text(quiz.description)
                .font(.system(size: 12, weight: .light, design: .rounded))
                .padding(.top, 5)
            Spacer()
            HStack {
                HStack(spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("PLAYS")
                            .font(.system(size: 7, weight: .black, design: .rounded))
                            .foregroundColor(Color("Dark3"))
                        Text(viewModel.getPlays(quizId: quiz.id))
                            .font(.system(size: 24, weight: .medium, design: .rounded))
                            .foregroundColor(Color("Dark3"))
                    }
                    VStack(alignment: .leading) {
                        Text("WINS")
                            .font(.system(size: 7, weight: .black, design: .rounded))
                            .foregroundColor(Color("Dark3"))
                        Text(viewModel.getWins(quizId: quiz.id))
                            .font(.system(size: 24, weight: .medium, design: .rounded))
                            .foregroundColor(Color("Dark3"))
                    }
                    VStack(alignment: .leading) {
                        Text("FAILS")
                            .font(.system(size: 7, weight: .black, design: .rounded))
                            .foregroundColor(Color("Dark3"))
                        Text(viewModel.getFails(quizId: quiz.id))
                            .font(.system(size: 24, weight: .medium, design: .rounded))
                            .foregroundColor(Color("Dark3"))
                    }
                }
                Spacer()
                VStack {
                    Button1(enabled: .constant(true), fontSize: 12)
                }
                .frame(maxWidth: 90, maxHeight: 40)
            }
        }
        .padding()
    }
    
    class ViewModel: NSObject, ObservableObject {
        
        func getPlays(quizId: String) -> String {
            return "\(UserDefaultsManager.shared.getPlays(quizId: quizId))"
        }
        
        func getWins(quizId: String) -> String {
            return "\(UserDefaultsManager.shared.getWins(quizId: quizId))"
        }
        
        func getFails(quizId: String) -> String {
            return "\(UserDefaultsManager.shared.getFails(quizId: quizId))"
        }
    }
}

struct Dedicated_QuizCardInteriorView_Previews: PreviewProvider {
    static var previews: some View {
        Dedicated_QuizCardInteriorView(quiz: QuizData.Math.addition1())
    }
}

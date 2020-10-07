//
//  GameTopView.swift
//  BrainStress
//
//  Created by Robert Sandru on 08/10/2020.
//

import SwiftUI

struct GameTopView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var gameModel: GameModel
    
    @State private var showingQuitAlert = false
    
    var body: some View {
        VStack {
            LogoView()
            HStack {
                Button(action: {
                    showingQuitAlert.toggle()
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.pink)
                })
                Spacer()
                Text("\(gameModel.timeRemainingQuizItem)")
                    .font(.custom("Marker Felt", size: 28))
                    .foregroundColor(Color.pink)
            }.padding()
        }
        .alert(isPresented: $showingQuitAlert, content: {
            Alert(title: Text("Are you sure?"),
                  message: Text("This game won't be saved. All your progress will be history. Do you, really, really agree? 😐"),
                  primaryButton: .default(Text("Yes")) {
                    presentationMode.wrappedValue.dismiss()
                  }, secondaryButton: .cancel())
        })
    }
}

struct GameTopView_Previews: PreviewProvider {
    static var previews: some View {
        GameTopView()
            .environmentObject(GameModel(quiz: QuizData.Math.dummyLevel()))
            .preferredColorScheme(.dark)
    }
}

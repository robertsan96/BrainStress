//
//  GameView.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import SwiftUI
import Introspect

struct BrainStressKeyboard: UIViewRepresentable {
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        var parent: BrainStressKeyboard
        
        init(parent: BrainStressKeyboard) {
            self.parent = parent
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            sendText()
            return false
        }
        
        func sendText() {
            let typedText: String = parent.textField.text ?? ""
            
            parent.textField.text = ""
            parent.onReturn(typedText)
        }
        
        @objc func didPressDone() {
            sendText()
        }
    }
    
    @State var textField = UITextField()
    var onReturn: (String) -> Void = { _ in }
    
    func makeUIView(context: Context) -> some UIView {
        textField.font = UIFont(name: "Marker Felt", size: 24)
        textField.text = nil
        textField.textColor = UIColor.systemPink
        textField.textAlignment = .center
        textField.placeholder = "Write here..."
        textField.delegate = context.coordinator
        textField.becomeFirstResponder()
        textField.keyboardType = .decimalPad
        
        textField.textContentType = .oneTimeCode
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.autocapitalizationType = .none
        
        let numberToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,
                                                    width: UIScreen.main.bounds.width,
                                                    height: 50))
        numberToolbar.sizeToFit()
        
        numberToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .done, target: context.coordinator, action: #selector(Coordinator.didPressDone))
        ]
        
        textField.inputAccessoryView = numberToolbar
        return textField
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
}

struct GameView: View {
    
    @EnvironmentObject var gameModel: GameModel
    
    var body: some View {
        ZStack {
            BackgroundView().edgesIgnoringSafeArea(.all)
            switch gameModel.gameState {
            case .warmUp: GameWarmUpView()
            case .playing, .paused:
                VStack {
                    GameTopView()
                    Spacer()
                    GameMidView()
                    Spacer()
                    GameBottomView()
                }
            case .end(_):
                GameEndView()
            default: Text("Ok dk")
            }
        }
        .modifier(AdaptsToSoftwareKeyboard())
        .navigationBarHidden(true)
    }
}

struct GameView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            GameView()
                .preferredColorScheme(.dark)
                .environmentObject(GameModel(quiz: QuizData.Math.dummyLevel()))
        }
    }
}

struct GameMidView: View {
    
    @EnvironmentObject var gameModel: GameModel
    
    @State var textField: UITextField?
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(gameModel.quizItem?.text ?? "")")
                .modifier(BrainStressFont(color: Color.pink, size: 36))
            BrainStressKeyboard() { text in
                gameModel.addAnswerToList(answer: text)
            }
            Spacer()
            Spacer()
        }
    }
}

struct GameBottomView: View {
    
    @EnvironmentObject var gameModel: GameModel
    
    var body: some View {
        Text("Bottom")
    }
}

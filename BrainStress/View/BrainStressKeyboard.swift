//
//  BrainStressKeyboard.swift
//  BrainStress
//
//  Created by Robert Sandru on 09/10/2020.
//

import SwiftUI

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

//
//  MathKeyboardView.swift
//  BrainStress
//
//  Created by Robert Sandru on 12/10/2020.
//

import SwiftUI

struct MathKeyboardView: View {
    
    @Binding var text: String
    
    var onSubmit: () -> Void = {}
    
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                ForEach(0 ..< 3) { item in
                    Button(action: {
                        text.append(String(item + 1))
                    }, label: {
                        KeyView(title: String(item + 1))
                    })
                }
            }
            HStack {
                ForEach(0 ..< 3) { item in
                    Button(action: {
                        text.append(String(item + 4))
                    }, label: {
                        KeyView(title: String(item + 4))
                    })
                }
            }
            HStack {
                ForEach(0 ..< 3) { item in
                    Button(action: {
                        text.append(String(item + 7))
                    }, label: {
                        KeyView(title: String(item + 7))
                    })
                }
            }
            HStack {
                
                Button(action: {
                    text = "-\(text.replacingOccurrences(of: "-", with: ""))"
                }, label: {
                    KeyView(image: "minus")
                })
                Button(action: {
                    text.append("0")
                }, label: {
                    KeyView(title: String(0))
                })
                Button(action: {
                    text = "\(text.replacingOccurrences(of: ".", with: ""))."
                }, label: {
                    KeyView(image: "dot.square")
                })
            }
            HStack {
                Button(action: {
                    if text.last != nil {
                        text.removeLast()
                    }
                }, label: {
                    KeyView(image: "delete.left.fill")
                })
                Button(action: {
                    onSubmit()
                }, label: {
                    KeyView(title: "Send", backgroundColor: Color.green)
                })
            }
        }
        .padding()
    }
}

struct MathKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        MathKeyboardView(text: .constant(""))
    }
}

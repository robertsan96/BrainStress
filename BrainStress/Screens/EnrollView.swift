//
//  EnrollView.swift
//  BrainStress
//
//  Created by Robert Sandru on 05/10/2020.
//

import SwiftUI

struct EnrollView: View {
    
    @State var nickname: String = ""
    @State var nextButtonEnabled: Bool = false
    
    var getTextfieldName: String {
        return nickname.isEmpty ? "anonymous" : nickname
    }
    
    var body: some View {
        ZStack {
            BackgroundView().edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                LogoView()
                    .frame(maxHeight: 200)
                Spacer()
                VStack(alignment: .leading) {
                    Text("Howdy, \(getTextfieldName)!")
                        .font(.custom("Marker Felt", size: 22))
                        .foregroundColor(Color.pink)
                    Text("We need no user accounts. Isn't it cool? Anyway, in order to make this experience great, we need your nickname.")
                        .font(.custom("Marker Felt", size: 16))
                        .padding(.top, 10)
                    TextField("My name is uvuvuevue...", text: $nickname)
                        .padding(.top, 10)
                        .onChange(of: nickname, perform: { value in
                            guard !value.isEmpty, value.count > 3 else {
                                nextButtonEnabled = false
                                return
                            }
                            nextButtonEnabled = true
                        })
                    
                }.padding()
                .background(Color(UIColor.tertiarySystemBackground))
                .cornerRadius(5)
                .padding()
                NavigationLink(
                    destination: MainView(),
                    label: {
                        RoundedButton1(enabled: $nextButtonEnabled, title: "Next")
                    })
                    .simultaneousGesture(TapGesture().onEnded({ tap in
                        if !nextButtonEnabled { return }
                        UserDefaultsManager.shared.set(nickname: nickname)
                    }))
                    .disabled(!nextButtonEnabled)
                Spacer()
                Spacer()
            }
        }
        .modifier(AdaptsToSoftwareKeyboard())
        .navigationBarHidden(true)
        
    }
}

struct EnrollView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EnrollView()
                .preferredColorScheme(.dark)
        }
    }
}

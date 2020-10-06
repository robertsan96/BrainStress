//
//  LogoView.swift
//  BrainStress
//
//  Created by Robert Sandru on 05/10/2020.
//

import SwiftUI

struct LogoView: View {
    
    var nickname: String {
        let storedNickname = UserDefaultsManager.shared.getNickname()
        guard !storedNickname.isEmpty else { return "the brain" }
        return storedNickname
    }
    
    var body: some View {
        VStack {
            Text("BrainStress")
                .font(.custom("Marker Felt", size: 42))
                .fontWeight(.black)
                .foregroundColor(.pink)
            Text("Here comes \(nickname) again")
                .foregroundColor(Color.gray)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView().previewLayout(.sizeThatFits)
    }
}

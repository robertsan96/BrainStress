//
//  LogoView.swift
//  BrainStress
//
//  Created by Robert Sandru on 05/10/2020.
//

import SwiftUI

struct LogoView: View {
    
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .antialiased(true)
                .scaledToFit()
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}

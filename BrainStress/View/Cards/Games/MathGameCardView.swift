//
//  MathGameCardView.swift
//  BrainStress
//
//  Created by Robert Sandru on 06/10/2020.
//

import SwiftUI

struct MathGameCardView: View {
    var body: some View {
        VStack {
            Card1Header()
            Spacer()
            HStack {
                Card1StressFactors()
                VStack {
                    NavigationLink(
                        destination: GameView(viewModel: GameViewModel()),
                        label: {
                            RoundedButton1(enabled: .constant(true),
                                           title: "Play",
                                           fontSize: 24,
                                           padding: 15,
                                           width: 20,
                                           height: 15,
                                           cornerRadius: 60)
                        })
                }.padding()
            }
            .background(Color.tertiarySystemGroupedBackground)
            
        }
        .frame(height: 350)
        .background(Card1(overlay: false,
                          primaryColor: Color.black,
                          secondaryColor: Color.pink,
                          backgroundSymbolColor: Color.pink.opacity(0.2)))
        .cornerRadius(15)
        .padding()
    }
}

struct MathGameCardView_Previews: PreviewProvider {
    static var previews: some View {
        MathGameCardView()
    }
}

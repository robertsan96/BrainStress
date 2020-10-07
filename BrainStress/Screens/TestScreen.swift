//
//  TestScreen.swift
//  BrainStress
//
//  Created by Robert Sandru on 07/10/2020.
//

import SwiftUI
import Combine

class TestViewModel: ObservableObject {
    
    @Published var secondsRemaining: Int = 3
    
    var cancellables: Set<AnyCancellable> = Set()
    
    private let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    
    init() {
        timer
            .handleEvents(receiveOutput: { [weak self] out in
                guard let self = self, self.secondsRemaining > 0 else { return }
                self.secondsRemaining -= 1
            })
            .sink { v in }
            .store(in: &cancellables)
            
    }
}

struct TestScreen: View {
    
    @ObservedObject var viewModel = TestViewModel()
    
    var body: some View {
        VStack {
            Button("Add 5 second") {
                viewModel.secondsRemaining += 5
            }
            Text(String(viewModel.secondsRemaining))
        }
    }
}

struct TestScreen_Previews: PreviewProvider {
    static var previews: some View {
        TestScreen()
    }
}

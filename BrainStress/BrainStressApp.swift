//
//  BrainStressApp.swift
//  BrainStress
//
//  Created by Robert Sandru on 05/10/2020.
//

import SwiftUI

@main
struct BrainStressApp: App {
    
    @ObservedObject var appModel: AppModel = AppModel()
    
    var body: some Scene {
        WindowGroup {
            GeometryReader { (proxy: GeometryProxy) in
                ContentView()
                    .environmentObject(appModel)
                    .onAppear() {
                        appModel.geometryProxy = proxy
                    }
            }
        }
    }
}

//
//  AppModel.swift
//  BrainStress
//
//  Created by Robert Sandru on 12/10/2020.
//

import SwiftUI
import Combine

class AppModel: ObservableObject {
    
    @Published var geometryProxy: GeometryProxy?
    
    func update(proxy: GeometryProxy) {
        geometryProxy = proxy
    }
}

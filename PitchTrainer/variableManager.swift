//
//  variableManager.swift
//  PitchTrainer
//
//  Created by Raphael on 21/05/24.
//

import Foundation

class variableManager: ObservableObject {
    static let shared = variableManager()
    
    @Published var note: String = "--"
    @Published var offset: Double = 0.0
}

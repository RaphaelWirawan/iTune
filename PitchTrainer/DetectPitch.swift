//
//  DetectPitch.swift
//  PitchTrainer
//
//  Created by Raphael on 15/05/24.
//

import Foundation
import Pitchy
import Beethoven
import UIKit
import SwiftUI

class DetectPitch {
    lazy var pitchEngine: PitchEngine = {
        let config = Config(estimationStrategy: .yin)
        let pitchEngine = PitchEngine(config: config, delegate: self)
        pitchEngine.levelThreshold = -30.0
        return pitchEngine
    }()
    
}

extension DetectPitch: PitchEngineDelegate {
    func pitchEngine(_ pitchEngine: PitchEngine, didReceivePitch pitch: Pitch) {
        variableManager.shared.note = pitch.note.string
        print(pitch.note.frequency)
        
        variableManager.shared.offset = pitch.closestOffset.percentage
//        let absOffsetPercentage = abs(offsetPercentage)
//        
//        print("pitch : \(pitch.note.string) - percentage : \(variableManager.shared.offset)") 
    }
    func pitchEngine(_ pitchEngine: PitchEngine, didReceiveError error: Error) {
        print(error)
    }
    func pitchEngineWentBelowLevelThreshold(_ pitchEngine: PitchEngine) {
        print("Below level threshold")
    }
}

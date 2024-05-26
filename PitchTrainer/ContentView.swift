//
//  ContentView.swift
//  PitchTrainer
//
//  Created by Raphael on 15/05/24.
//

import SwiftUI
import Pitchy
import Beethoven

struct ContentView: View {
    @State var note = "--"
    @State private var minValue = "♭"
    @State private var maxValue = "#"
//    @State private var  = 170.0
    
    @StateObject var varManager: variableManager = variableManager.shared
    
    var pitch = DetectPitch()
    
    
    var body: some View {
        VStack {
            Text(varManager.note)
                .font(.system(size: 80))
                .padding(70)
            Gauge (value: varManager.offset, in: -100...100) {
                Text("")
            } currentValueLabel: {
                Text("")
            } minimumValueLabel: {
                Text("\(minValue)")
                    .font(.system(size: 40))
            } maximumValueLabel: {
                Text("\(maxValue)")
                    .font(.system(size: 30))
            }
            .gaugeStyle(.accessoryLinear)
            
        }
        .padding()
        .onAppear() {
            pitch.pitchEngine.start()
        }
    }
}

#Preview {
    ContentView()
}

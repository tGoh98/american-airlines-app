//
//  Diedrate.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import SwiftUI
import ConfettiSwiftUI

struct Diedrate: View {
    @EnvironmentObject var modelData: ModelData
    @State var counter: Int = 0
    
    var body: some View {
        VStack {
            ZStack {
                MyLines(startX: 100, startY: 500, endY: 100)
                Button(action: {
                    var cur = modelData.intake.curIntake
                    let needed = modelData.intake.neededIntake
                    
                    if (cur < needed) {
                        modelData.intake.curIntake += 1
                        cur += 1
                    }
                    if (cur == needed) {
                        counter += 1
                    }
                }) {
                    HStack {
                        Text("Took a shot")
                        Text("\(modelData.intake.neededIntake - modelData.intake.curIntake)")
                    }
                }
                ConfettiCannon(counter: $counter, num: 1, confettis: [.text("🔫"), .text("🌊"), .text("🚰"), .text("💦"), .text("💧")], confettiSize: 20, repetitions: 100, repetitionInterval: 0.01)
            }
            Button(action: {
                modelData.intake.curIntake = 0
            }) {
                Text("reset")
            }
        }
    }
}

struct Diedrate_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        Diedrate()
            .environmentObject(modelData)
    }
}

struct MyLines: View {
    @EnvironmentObject var modelData: ModelData
    
    var startX: CGFloat
    var startY: CGFloat
    var endY: CGFloat
    
    var body: some View {
        
        var percentage = (CGFloat) (modelData.intake.neededIntake - modelData.intake.curIntake) / CGFloat(modelData.intake.neededIntake)
        
        Path { path in
            path.move(to: CGPoint(x: startX, y: startY))
            path.addLine(to: CGPoint(x: startX, y: endY))
        }
        .trim(from: 0, to: percentage) // << breaks path by parts, animatable
        .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        .animation(.easeOut(duration: 1.0)) // << animate
        .onAppear {
            percentage = 1.0 // << activates animation for 0 to the end
        }
    }
}

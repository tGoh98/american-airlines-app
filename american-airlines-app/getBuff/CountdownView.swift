//
//  CountdownView.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import SwiftUI

let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct Clock: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.system(size: 60))
                .foregroundColor((CGFloat(counter) / CGFloat(countTo) == 1) ? Color.green : Color.init(hex:"007AFF"))
                
        }
    }
    
    func counterToMinutes() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        
        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
    
}

struct ProgressTrack: View {
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 250, height: 250)
            .overlay(
                Circle().stroke(Color.init(hex:"DADADA"), lineWidth: 9)
        )
    }
}

struct ProgressBar: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 250, height: 250)
            .overlay(
                Circle().trim(from:0, to: progress())
                    .stroke(
                        style: StrokeStyle(
                            lineWidth: 9,
                            lineCap: .round,
                            lineJoin:.round
                        )
                )
                    .rotationEffect(.degrees(-90))
                    .foregroundColor(
                        (completed() ? Color.green : Color.init(hex:"007AFF"))
                ).animation(
                    .easeInOut(duration: 0.2)
                )
        )
    }
    
    func completed() -> Bool {
        return progress() == 1
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}

struct CountdownView: View {
    @State var counter: Int = 0
    var countTo: Int
    @Binding var done: Bool
    @Binding var counter2: Int
    
    var body: some View {
        VStack{
            ZStack{
                ProgressTrack()
                ProgressBar(counter: counter, countTo: countTo)
                Clock(counter: counter, countTo: countTo)
            }
        }.onReceive(timer) { time in
            if (self.counter < self.countTo) {
                self.counter += 1
            } else {
                usleep(500000)
                self.done = true
                self.counter2 += 1
            }
        }
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(countTo: 30, done: .constant(false), counter2: .constant(0))
    }
}


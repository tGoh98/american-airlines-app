//
//  WorkingOut.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import SwiftUI
import ConfettiSwiftUI

struct WorkingOut: View {
    @Binding var buffIndex: Int
    var eCard: ExerciseCard
    @State var done: Bool = false
    @State var counter: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.buffIndex = 2
                }) {
                    Image("leftArrow")
                        .frame(minWidth: 50, minHeight: 25)
                        .contentShape(Rectangle())
                }
                Spacer()
                Text("Working Out")
                    .font(Font.title2.weight(.semibold))
                    .foregroundColor(Color.init(hex: "0E57BD"))
                    .padding()
                    .offset(x: -110)
            }
            
            ConfettiCannon(counter: $counter, num: 100)
                .offset(y: 300)
            if (!done) {
                CountdownView(countTo: 30, done: $done, counter2: $counter)
                    .padding()
                
                HStack(spacing: 100) {
                    Image("backIcon")
                    Image("pauseIcon")
                    Image("fwdIcon")
                }
                .padding()
                
                eCard
                    .padding(.vertical)
            } else {
                Group {
                    Text("Congrats!\nYou finished your \nworkout, keep it up :)")
                        .foregroundColor(Color.init(hex:"007AFF"))
                        .font(.title)
                        .padding(.horizontal)
                }
                .padding(.top, 160)
                .padding(.bottom, 240)
                .padding(.horizontal, 30)
            }
        }
    }
}

struct WorkingOut_Previews: PreviewProvider {
    static var previews: some View {
        WorkingOut(buffIndex: .constant(3), eCard: ExerciseCard(title: "Lateral Spine Bend", imgSrc: "workout7", desc: "Stand with legs hip width apart, hands by your sides. Pretend you are holding a heavy weight in your left hand and bend sideways on the left, as far as you can. Straighten up and repeat on right side."))
    }
}

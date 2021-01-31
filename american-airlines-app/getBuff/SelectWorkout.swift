//
//  SelectWorkout.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import SwiftUI

struct SelectWorkout: View {
    @Binding var buffIndex: Int
    @Binding var selectedExercise: Int
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.buffIndex = 0
                }) {
                    Image("leftArrow")
                        .frame(minWidth: 50, minHeight: 25)
                        .contentShape(Rectangle())
                }
                Spacer()
                Text("Select Workout")
                    .font(Font.title2.weight(.semibold))
                    .foregroundColor(Color.init(hex: "0E57BD"))
                    .padding()
                    .offset(x: -95)
            }
            
            VStack(spacing: 50) {
                Button(action: {
                    self.selectedExercise = Int.random(in: 1..<7)
                    self.buffIndex = 3
                }) {
                    Image("seatedExercises")
                }
                Button(action: {
                    self.selectedExercise = Int.random(in: 7..<10)
                    self.buffIndex = 3
                }) {
                    Image("standingExercises")
                }
                Button(action: {
                    self.selectedExercise = Int.random(in: 1..<10)
                    self.buffIndex = 3
                }) {
                    Image("allExercises")
                }
            }.padding(.bottom, 40)
            
            Text("*when doing standing exercises, be sure to only do so when safe")
                .font(.system(size: 10))
                .foregroundColor(Color.init(hex: "0E57BD"))
                .padding(.horizontal)
                .padding(.bottom, 5)
        }
    }
}

struct SelectWorkout_Previews: PreviewProvider {
    static var previews: some View {
        SelectWorkout(buffIndex: .constant(2), selectedExercise: .constant(1))
    }
}

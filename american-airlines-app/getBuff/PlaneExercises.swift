//
//  PlaneExercises.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import SwiftUI

struct PlaneExercises: View {
    @Binding var buffIndex: Int
    
    var body: some View {
        VStack {
            HStack {
                Text("Plane Exercises")
                    .font(Font.title2.weight(.semibold))
                    .foregroundColor(Color.init(hex: "0E57BD"))
                    .padding()
                    .offset(x:50)
                Spacer()
                Button(action: {
                    self.buffIndex = 1
                }) {
                    Image("rightArrow")
                }
            }
            Group {
                Text("Being immobile for too long can have negative health impacts and leave you stiff. Repeat these simple exercises regularly, about every 30 min, as well as getting out of your seat and walking around when possible, to stay active during your flight!")
                    .font(.system(size: 15))
                    .foregroundColor(Color.init(hex: "0e57bd"))
                    .padding(.leading, 12)
                    .padding(.trailing, 3)
                    .opacity(0.6)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:140)
            .background(Color.init(hex: "007AFF").opacity(0.1).clipShape(RoundedRectangle(cornerRadius: 8.0)))
            Group {
                HStack {
                    Image("workout1")
                        .frame(maxWidth: .infinity)
                    Image("workout2")
                        .frame(maxWidth: .infinity)
                    Image("workout3")
                        .frame(maxWidth: .infinity)
                }
                HStack {
                    Image("workout4")
                        .frame(maxWidth: .infinity)
                    Image("workout5")
                        .frame(maxWidth: .infinity)
                    Image("workout6")
                        .frame(maxWidth: .infinity)
                }
                HStack {
                    Image("workout7")
                        .frame(maxWidth: .infinity)
                    Image("workout8")
                        .frame(maxWidth: .infinity)
                    Image("workout9")
                        .frame(maxWidth: .infinity)
                }
            }
            
            Button(action: {
                self.buffIndex = 2
            }) {
                Group {
                    Text("Select Workout")
                        .foregroundColor(.white)
                        .font(Font.title3.weight(.semibold))
                        .padding(.vertical, 5)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.init(hex: "0E57BD").clipShape(RoundedRectangle(cornerRadius: 8.0)))
                .padding(.vertical)
            }
        }
    }
}

struct PlaneExercises_Previews: PreviewProvider {
    static var previews: some View {
        PlaneExercises(buffIndex: .constant(0))
    }
}

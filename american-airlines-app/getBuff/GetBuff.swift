//
//  GetBuff.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import SwiftUI

struct GetBuff: View {
    @State var buffIndex: Int = 3
    // 0 is home
    // 1 is desc
    // 2 is select
    // 3 is seated
    // 4 is standing
    // 5 is all
    
    var body: some View {
        switch (buffIndex) {
        case 0:
            PlaneExercises(buffIndex: $buffIndex)
                .padding(.horizontal, 25)
        case 1:
            ExerciseDesc(buffIndex: $buffIndex)
        case 2:
            SelectWorkout(buffIndex: $buffIndex)
        case 3:
            WorkingOut(buffIndex: $buffIndex)
//        case 4:
//            StandingExercises(buffIndex: $buffIndex)
//        case 5:
//            AllExercises(buffIndex: $buffIndex)
        default:
            Text("unrecognized")
        }
        
        
    }
}

struct GetBuff_Previews: PreviewProvider {
    static var previews: some View {
        GetBuff()
    }
}

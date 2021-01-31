//
//  ExerciseCard.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import SwiftUI

struct ExerciseCard: View {
    var title: String
    var imgSrc: String
    var desc: String
    
    var body: some View {
        HStack {
            VStack {
                Text(title)
                    .foregroundColor(Color.init(hex: "0E57BD"))
                    .font(.system(size: 15))
                Image(imgSrc)
            }
            Group {
                Text(desc)
                    .font(.system(size: 15))
                    .foregroundColor(Color.init(hex: "0e57bd"))
                    .padding(.leading, 12)
                    .padding(.trailing, 3)
                    .padding(.vertical, 5)
                    .opacity(0.6)
            }
            .frame(minWidth: 250, maxWidth: 250, minHeight: 0, maxHeight:140)
            .background(Color.init(hex: "007AFF").opacity(0.1).clipShape(RoundedRectangle(cornerRadius: 8.0)))
        }
        .padding(.horizontal)
    }
}

struct ExerciseCard_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseCard(title: "Toe lifts", imgSrc: "workout1", desc: "Start with both feet flat on the floor. Lift toes off the floor as far as you can and hold, then let them fall again. Next, lift heels off the floor to tighten leg muscles, repeat 10 times.")
    }
}

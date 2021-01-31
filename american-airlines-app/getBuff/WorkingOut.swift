//
//  WorkingOut.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import SwiftUI

struct WorkingOut: View {
    @Binding var buffIndex: Int
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.buffIndex = 0
                }) {
                    Image("leftArrow")
                }
                Text("Working Out")
                    .font(Font.title2.weight(.semibold))
                    .foregroundColor(Color.init(hex: "0E57BD"))
                    .padding()
                    .offset(x: 50)
            }
            .padding(.trailing, 100)
            
            
        }
    }
}

struct WorkingOut_Previews: PreviewProvider {
    static var previews: some View {
        WorkingOut(buffIndex: .constant(3))
    }
}

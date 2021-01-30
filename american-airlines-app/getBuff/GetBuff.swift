//
//  GetBuff.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import SwiftUI
import ConfettiSwiftUI

struct GetBuff: View {
    @State var counter: Int = 0
    
    var body: some View {
        ZStack{
            Button(action: {
                counter += 1
            }) {
                Text("party")
            }
            ConfettiCannon(counter: $counter)
        }
    }
}

struct GetBuff_Previews: PreviewProvider {
    static var previews: some View {
        GetBuff()
    }
}

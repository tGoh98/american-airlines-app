//
//  GetBuff.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import SwiftUI

struct GetBuff: View {
    
    var body: some View {
        VStack {
            Text("rah")
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
    }
}

struct GetBuff_Previews: PreviewProvider {
    static var previews: some View {
        GetBuff()
    }
}

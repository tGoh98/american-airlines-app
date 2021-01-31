//
//  MsgCard.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/31/21.
//

import SwiftUI

struct MsgCard: View {
    var msg: String
    
    var body: some View {
        Group {
            Text(msg)
                .foregroundColor(Color.init(hex: "007AFF"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 5)
                .padding(.leading, 20)
                
        }
        .frame(width: 325)
        .padding(.vertical, 5)
        .background(Color.init(hex: "e8f3ff").clipShape(RoundedRectangle(cornerRadius: 8.0)))
    }
}

struct MsgCard_Previews: PreviewProvider {
    static var previews: some View {
        MsgCard(msg: "Please bring me some water :-)")
    }
}

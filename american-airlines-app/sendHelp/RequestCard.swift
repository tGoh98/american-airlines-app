//
//  RequestCard.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/31/21.
//

import SwiftUI
import FirebaseDatabase

struct RequestCard: View {
    var name: String
    var msg: String
    var reqTime: String
    var id: String
    var dbAccess: DBAccess
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("\(name) (Seat \(id))")
                    .bold()
                Text(msg)
                    .opacity(0.8)
            }
            .foregroundColor(Color.init(hex: "0E57BD"))
            .padding(.trailing)
            Spacer()
            VStack {
                Text(reqTime)
                    .foregroundColor(Color.gray)
                Button(action: {
                    dbAccess.removeReq(id: self.id)
                }) {
                    Text("X")
                }.padding()
            }
        }
        .frame(width: 300)
    }
}

struct RequestCard_Previews: PreviewProvider {
    static var previews: some View {
        RequestCard(name: "James", msg: "Please bring me some water.", reqTime: "9:41", id: "38A", dbAccess: DBAccess(dbref: Database.database().reference()))
    }
}

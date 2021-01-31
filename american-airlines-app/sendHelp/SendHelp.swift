//
//  SendHelp.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import SwiftUI
import FirebaseDatabase

struct SendHelp: View {
    @State private var content: String = ""
    @EnvironmentObject var modelData: ModelData
    var dbref: DatabaseReference = Database.database().reference()
    
    
    var body: some View {
        var access:DBAccess = DBAccess(dbref: dbref)

        
        VStack{
            HStack {
                Button(action: {
                    access.sendRequest(id: modelData.seatnum, name: modelData.name, time: Date.init(), content: "May I have some water please?")
                }) {
                    Text("I'd like some water, please")
                        .font(Font.title2.weight(.semibold))
                        .foregroundColor(Color.init(hex: "0E57BD"))
                        .padding()
                }
                Spacer()
            
                Button(action: {
                    access.sendRequest(id: modelData.seatnum, name: modelData.name, time: Date.init(), content: "May I have a blanket please?")
                    
                }) {
                    Text("I'd like a blanket, please")
                        .font(Font.title2.weight(.semibold))
                        .foregroundColor(Color.init(hex: "0E57BD"))
                        .padding()
                }
            Spacer()
            }
            HStack {
                Button(action: {
                    access.sendRequest(id: modelData.seatnum, name: modelData.name, time: Date.init(), content: "I'd like to order food, please.")
                }) {
                    Text("I'd like to order food, please")
                        .font(Font.title2.weight(.semibold))
                        .foregroundColor(Color.init(hex: "0E57BD"))
                        .padding()
                }
                Spacer()
            
                Button(action: {
                    access.sendRequest(id: modelData.seatnum, name: modelData.name, time: Date.init(), content: "May I please have some earbuds?")
                    
                }) {
                    Text("I'd like earbuds, please")
                        .font(Font.title2.weight(.semibold))
                        .foregroundColor(Color.init(hex: "0E57BD"))
                        .padding()
                }
        Spacer()
            }
            VStack(alignment: .leading){
                Text("Custom Request").bold()
            TextField("Need something?", text: $content, onCommit: {
                access.sendRequest(id: modelData.seatnum, name: modelData.name, time: Date.init(), content: content)
                
            }).padding()
            }

            
            
            
            
            
            
    }
        
    }
}

struct SendHelp_Previews: PreviewProvider {
    static var previews: some View {
        SendHelp()
    }
}

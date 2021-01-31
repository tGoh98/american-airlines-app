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
    @State private var queue: String = ""
    let access:DBAccess = DBAccess(dbref: Database.database().reference()) // has to be out here so doesnt reload ever time u click button
    @State var received: Bool = false
    let t = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var initialCall: Bool = false
    
    var body: some View {
        if (modelData.attendantMode) {
            Attendant()
        } else {
            VStack {
                if (!received) {
                    Text("Message a Flight Attendant")
                        .font(Font.title2.weight(.semibold))
                        .foregroundColor(Color.init(hex: "0E57BD"))
                        .padding()
                        .onReceive(t) { _ in
                            if (!self.initialCall) {
                                self.initialCall = true
                                access.getNumAhead(time: Date.init())
                            }
                        }
                    Text("How can we help you today?")
                        .font(.headline)
                        .foregroundColor(Color.init(hex: "0E57BD"))
                        .padding()
                    
                    VStack(spacing: 13) {
                        Button(action: {
                            access.getNumAhead(time: Date.init())
                            content = "Please bring me some water :-)"
                            access.sendRequest(id: modelData.seatnum, name: modelData.name, time: Date.init(), content: "Please bring me some water :-)")
                            self.received = true
                        }) {
                            MsgCard(msg: "Please bring me some water :-)")
                        }
                        Button(action: {
                            access.getNumAhead(time: Date.init())
                            content = "I would like some headphones!"
                            access.sendRequest(id: modelData.seatnum, name: modelData.name, time: Date.init(), content: "I would like some headphones!")
                            self.received = true
                        }) {
                            MsgCard(msg: "I would like some headphones!")
                        }
                        Button(action: {
                            access.getNumAhead(time: Date.init())
                            content = "Can I have some tissues?"
                            access.sendRequest(id: modelData.seatnum, name: modelData.name, time: Date.init(), content: "Can I have some tissues?")
                            self.received = true
                        }) {
                            MsgCard(msg: "Can I have some tissues?")
                        }
                        Button(action: {
                            access.getNumAhead(time: Date.init())
                            content = "I'd like an extra blank/pillow"
                            access.sendRequest(id: modelData.seatnum, name: modelData.name, time: Date.init(), content: "I'd like an extra blank/pillow")
                            self.received = true
                        }) {
                            MsgCard(msg: "I'd like an extra blank/pillow")
                        }
                        Button(action: {
                            access.getNumAhead(time: Date.init())
                            content = "I need help getting some baggage"
                            access.sendRequest(id: modelData.seatnum, name: modelData.name, time: Date.init(), content: "I need help getting some baggage")
                            self.received = true
                        }) {
                            MsgCard(msg: "I need help getting some baggage")
                        }
                        Button(action: {
                            access.getNumAhead(time: Date.init())
                            content = "Catalogue? I'd like to buy something"
                            access.sendRequest(id: modelData.seatnum, name: modelData.name, time: Date.init(), content: "Catalogue? I'd like to buy something")
                            self.received = true
                        }) {
                            MsgCard(msg: "Catalogue? I'd like to buy something")
                        }
                    }.padding(.bottom)
                    
                    Group {
                        ZStack(alignment: .leading) {
                            if content.isEmpty {
                                Text("Custom questions or requests").foregroundColor(Color.black)
                                    .padding(.horizontal)
                            }
                            TextField("", text: $content, onCommit: {
                                access.getNumAhead(time: Date.init())
                                access.sendRequest(id: modelData.seatnum, name: modelData.name, time: Date.init(), content: content)
                                self.received = true
                            })
                            .frame(width: 325)
                            .padding(.vertical, 7)
                        }
                        .background(Color.init(hex: "767680"))
                        .opacity(0.12)
                        .cornerRadius(8.0)
                        .padding()
                    }
                } else {
                    VStack {
                        HStack {
                            Button(action: {
                                self.received = false
                            }) {
                                Image("leftArrow")
                                    .frame(minWidth: 50, minHeight: 25)
                                    .contentShape(Rectangle())
                            }
                            Spacer()
                        }.padding(.top)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Your request, \"\(content)\", was successfully received. We will be with you shortly!")
                            Text("You are currently number \(access.numahead) in line.")
                        }
                        .padding()
                        .foregroundColor(Color.init(hex: "007AFF"))
                    }
                }
            }
        }
        
    }
}

struct SendHelp_Previews: PreviewProvider {
    static var previews: some View {
        SendHelp()
            .environmentObject(ModelData())
    }
}

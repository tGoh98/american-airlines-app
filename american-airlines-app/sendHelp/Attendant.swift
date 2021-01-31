//
//  SendHelp.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import SwiftUI
import FirebaseDatabase

struct Attendant: View {
    @State private var content: String = ""
    @EnvironmentObject var modelData: ModelData
//    var dbref: DatabaseReference = Database.database().reference()
    @State private var queue: String = ""
    let access:DBAccess = DBAccess(dbref: Database.database().reference()) // has to be out here so doesnt reload ever time u click button

    init() {
        access.readRequests()
    }
    
    func deleteReq(id: String){
        if (access.reqs.count > 0) {
            print(access.reqs.first!.requester)
            print(access.reqs.first!.id)
            
            access.removeReq(id: access.reqs.first!.id)
        }
        
    }
    
    var body: some View {
        
                
        VStack{
            Text(queue).font(Font.title2.weight(.semibold))
                .foregroundColor(Color.init(hex: "0E57BD"))
                .padding()
            
            HStack {
                Button(action: {
                    if (access.reqs.count > 0) {
                        deleteReq(id: access.reqs.first!.id)
                    }
                    
                }) {
                    Text("Delete Req")
                        .font(Font.title2.weight(.semibold))
                        .foregroundColor(Color.init(hex: "0E57BD"))
                        .padding()
                }
                Spacer()
            }
            HStack {
                NavigationView {
                    List(access.reqs) { req in
                        Text(req.content)
                    }
                    
                }
            }

      
        
            
            
    }
        
    }
}

struct Attendant_Previews: PreviewProvider {
    static var previews: some View {
        SendHelp()
    }
}

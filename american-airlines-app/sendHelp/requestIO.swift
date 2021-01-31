//
//  requestIO.swift
//  american-airlines-app
//
//  Created by Colin King on 1/31/21.
//

import Foundation
import FirebaseDatabase

class DBAccess {
    
    var numahead: Int = 0
    var dbref: DatabaseReference
    var changed: Bool = false
    var reqs: Array<Request> = Array.init()
    init(dbref: DatabaseReference) {
        self.dbref = dbref
    }
    
    
    func sendRequest(id: String, name: String, time: Date, content: String) {
        let stamp = DateFormatter.localizedString(from: time, dateStyle: .short, timeStyle: .short)
        self.dbref.child("requests").child(id).setValue(["content":content, "time": stamp, "name":name])
    }
    
    
    func getNumAhead(time: Date) -> Int {
        let reqRef = self.dbref.child("requests")
        let stamp = DateFormatter.localizedString(from: time, dateStyle: .short, timeStyle: .short)
        let otherReqs = reqRef.queryOrdered(byChild: "time").queryEnding(beforeValue: stamp)
        let group = DispatchGroup()
        group.enter()
        otherReqs.observeSingleEvent(of: .value, with: { (snapshot) in
            self.numahead = Int(snapshot.childrenCount)
            group.leave()
        })
        return self.numahead
    }
    
    func readRequests() {
        var localReqs: Array<Request> = [Request]()
        self.dbref.child("requests").observeSingleEvent(of: .value, with: { (snapshot) in
//            print(snapshot.childrenCount)
            let enumerator = snapshot.children
            while let rest = enumerator.nextObject() as? DataSnapshot {
                let v = rest.value as? NSDictionary
                let name = v?["name"] as? String ?? ""
                let content = v?["content"] as? String ?? ""
                let time = v?["time"] as? String ?? ""
                localReqs.append(Request(id: rest.key, requester: name, time: time, content: content))
                self.reqs = localReqs
            }
        })
    }
    
    func removeReq(id: String) {
        self.dbref.child("requests").child(id).removeValue()
        print("deleted with id: " + id)
        self.readRequests()
}

}

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
    
    init(dbref: DatabaseReference) {
        self.dbref = dbref
    }
    
    func getMapUrl(text:String) -> String {
        let pattern = #"(?<=fvPublicSiteFT)(.*?)(?=">)"#
        let regex = try! NSRegularExpression(pattern: pattern, options: .anchorsMatchLines)
        let stringRange = NSRange(location: 0, length: text.utf16.count)
        let mapstring = regex.firstMatch(in: text, range: stringRange)
        let r = mapstring?.range
        let matchStr = (text as NSString).substring(with: r!)
        
        //        let timeRemPat = #"(?<=Time Remaining:)(.*?)(?=">)"#
        return matchStr.replacingOccurrences(of: "&amp;", with: "&")
    }
    
    
    func sendRequest(id: String, name: String, time: Date, content: String) {
        let r = Request(id: id, requester: name, time: time, content: content)
        self.dbref.child("requests").child(id).setValue(["content":content, "time": time, "name":name])
    }
    
    
    func getNumAhead(time: Date) -> Int {
        let reqRef = self.dbref.child("requests")
        let otherReqs = reqRef.queryOrdered(byChild: "time").queryEnding(beforeValue: time)
        otherReqs.observeSingleEvent(of: .value, with: { (snapshot) in
            self.numahead = Int(snapshot.childrenCount)
        })
        return 0
        
    }
    
    func readRequests() -> Array<Request> {
        var reqs: Array<Request> = [Request]()
        self.dbref.child("requests").observeSingleEvent(of: .value, with: { (snapshot) in
            let enumerator = snapshot.children
            while let rest = enumerator.nextObject() as? DataSnapshot {
                let v = rest.value as? NSDictionary
                let name = v?["name"] as? String ?? ""
                let content = v?["content"] as? String ?? ""
                let date = v?["time"] as? Date
            }
            
        })
        return reqs
    }
    
    func removeReq(id: String) {
        self.dbref.child("requests").queryEqual(toValue: id).removeAllObservers()
    }
}

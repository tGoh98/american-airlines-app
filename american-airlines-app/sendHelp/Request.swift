//
//  User.swift
//  american-airlines-app
//
//  Created by Colin King on 1/30/21.
//

import Foundation

class Request: Identifiable {
    
    var id: String
    var requester: String
    var reqObjTime: String
    var content: String
    
    init(id: String, requester: String, time: String, content: String) {
        self.id = id
        self.requester = requester
        self.reqObjTime = time
        self.content = content
    }
    
    
    
}

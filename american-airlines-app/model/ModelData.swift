//
//  ModelData.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import Foundation
import SwiftUI

final class ModelData: ObservableObject {
    
    
    
    @Published var intake: Intake = Intake(curIntake: 0, neededIntake: 2000)
    @Published var fn = "2344" // TODO: Grab from flight info
    @Published var date = "20210131" // TODO: get current date
    
    var planeImg: Image = Image("aaLogo")
    var name: String = "Tim"
    var seatnum: String = String(Int.random(in: 0..<40)) + String("ABCDEFGHIJKLMNOP".randomElement()!)
    var dest: String = ""
    var start: String  = ""
    var timeRem: String  = ""
    var aircraft: String  = ""
    var speed: String = ""
    var altitude: String = ""
    
    var attendantMode: Bool = false
    
   
}

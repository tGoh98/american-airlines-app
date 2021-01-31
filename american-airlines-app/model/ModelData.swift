//
//  ModelData.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import Foundation
import SwiftUI

final class ModelData: ObservableObject {
    @Published var intake: Intake = Intake(curIntake: 0, neededIntake: 10)
    @Published var fn = "9716" // TODO: Grab from flight info
    @Published var date = "20210130" // TODO: get current date
    
    var planeImg: Image = Image("aaLogo")
    var dest: String = ""
    var start: String  = ""
    var timeRem: String  = ""
    var flightNum: String  = ""
    var aircraft: String  = ""
    var speed: String = ""
    var altitude: String = ""
    
    
    
   
}

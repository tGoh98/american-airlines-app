//
//  american_airlines_appApp.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import SwiftUI
import Firebase

@main
struct american_airlines_appApp: App {
    @StateObject private var modelData = ModelData()
    @State var step: Int = 0
    let splashTimer = Timer.publish(every: 3, on: .current, in: .common).autoconnect()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if (step == 0) {
                Splash()
            } else if (step == 1) {
                Login(step: $step)
                    .environmentObject(modelData)
            } else {
                ContentView()
                    .environmentObject(modelData)
            }
            Text("")
                .frame(maxWidth: 0, maxHeight:0)
                .onReceive(splashTimer) { _ in
                    if (self.step == 0) {
                        self.step += 1
                    }
                }
        }
    }
}

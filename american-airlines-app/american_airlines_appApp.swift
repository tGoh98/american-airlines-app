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
    @State var loading: Bool = true
    let splashTimer = Timer.publish(every: 5, on: .current, in: .common).autoconnect()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if (loading) {
                Splash()
            } else {
                ContentView()
                    .environmentObject(modelData)
            }
            Text("")
                .frame(maxWidth: 0, maxHeight:0)
                .onReceive(splashTimer) { _ in
                    self.loading = false
                }
        }
    }
}

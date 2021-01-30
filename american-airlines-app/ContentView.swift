//
//  ContentView.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        TabView {
            Diedrate()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Hydrate")
                }
            GetBuff()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Exercise")
                }
            SendHelp()
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Call Attendant")
                }
            Snooze()
                .tabItem {
                    Image(systemName: "4.square.fill")
                    Text("Jetlag")
                }
        }
        .font(.headline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}

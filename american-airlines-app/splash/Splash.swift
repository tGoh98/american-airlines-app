//
//  Splash.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/31/21.
//

import SwiftUI

struct Splash: View {
    var body: some View {
        VStack {
            HStack {
                Text("American")
                    .font(Font.title.weight(.semibold))
                Image("aaLogo")
            }
            .padding(.top, 100)
            AnimatedImageView(fileName: "splash")
                .padding(.top, 150)
                .padding(.bottom, 250)
        }
        .background(Color.init(hex: "CDE9F5"))
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}

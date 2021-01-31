//
//  PlaneView.swift
//  american-airlines-app
//
//  Created by Nathan Park on 1/30/21.
//

import SwiftUI

struct PlaneView: View {
    @EnvironmentObject var modelData: ModelData
    var pImg: Image
    var body: some View {
        VStack{
            pImg
            HStack{
                Text(modelData.timeRem).background(Color.white)
                
                
                Text(modelData.altitude).background(Color.white)
            }
            
        }
        
    }
}

struct PlaneView_Previews: PreviewProvider {
    static var previews: some View {
        PlaneView(pImg: Image("aaLogo"))
            .environmentObject(ModelData())
    }
}

//
//  Login.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/31/21.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var step: Int
    @State var goToLogin: Bool = false
    @State var lastName: String = ""
    @State var username: String = ""
    @State var flightNum: String = ""
    @State var password: String = ""
    @State var keepMe: Bool = true
    
    var body: some View {
        VStack {
            HStack {
                Text("American")
                    .font(Font.title.weight(.semibold))
                    .foregroundColor(.white)
                Image("aaLogo")
            }
            .offset(y:55)
            Spacer()
            if (!goToLogin) {
                VStack(spacing: 50) {
                    Button(action: { modelData.attendantMode = false; self.goToLogin = true }) {
                        Group {
                            Text("Passenger Login")
                                .foregroundColor(.white)
                                .font(Font.title3.weight(.semibold))
                                .padding(.vertical, 5)
                        }
                        .padding(.horizontal, 60)
                        .padding(.vertical, 5)
                        .background(Color.init(hex: "0E57BD").clipShape(RoundedRectangle(cornerRadius: 8.0)))
                    }
                    
                    Button(action: { modelData.attendantMode = true; self.goToLogin = true }) {
                        Group {
                            Text("Attendant Login")
                                .foregroundColor(.white)
                                .font(Font.title3.weight(.semibold))
                                .padding(.vertical, 5)
                        }
                        .padding(.horizontal, 60)
                        .padding(.vertical, 5)
                        .background(Color.init(hex: "D33846").clipShape(RoundedRectangle(cornerRadius: 8.0)))
                    }
                }
                Spacer()
            } else {
                VStack {
                    ZStack(alignment: .leading) {
                        if lastName.isEmpty { Text("Last name").foregroundColor(Color.init(hex:"3C3C43")).opacity(0.3) }
                        TextField("Last name", text: $lastName)
                            .foregroundColor(Color.init(hex:"3C3C43"))
                    }
                    Divider()
                    ZStack(alignment: .leading) {
                        if username.isEmpty { Text("AAdvantage # or Username name").foregroundColor(Color.init(hex:"3C3C43")).opacity(0.3) }
                        TextField("", text: $username)
                            .foregroundColor(Color.init(hex:"3C3C43"))
                    }
                    Divider()
                    ZStack(alignment: .leading) {
                        if flightNum.isEmpty { Text("Flight #").foregroundColor(Color.init(hex:"3C3C43")).opacity(0.3) }
                        TextField("", text: $flightNum)
                            .foregroundColor(Color.init(hex:"3C3C43"))
                    }
                    Divider()
                    ZStack(alignment: .leading) {
                        if password.isEmpty { Text("Password").foregroundColor(Color.init(hex:"3C3C43")).opacity(0.3) }
                        TextField("", text: $password)
                            .foregroundColor(Color.init(hex:"3C3C43"))
                    }
                    Divider()
                    HStack {
                        Toggle(isOn: $keepMe) {
                            Text("Keep me logged in")
                                .foregroundColor(Color.init(hex:"3C3C43"))
                                .opacity(0.3)
                        }.toggleStyle(SwitchToggleStyle(tint: modelData.attendantMode ? Color.init(hex:"D33846") : Color.init(hex: "0E57BD")))
                    }
                }
                .padding()
                .background(Color.white).clipShape(RoundedRectangle(cornerRadius: 8.0))
                .padding(.horizontal, 25)
                Button(action: {
                    modelData.name = lastName
                    modelData.flightNum = flightNum
                    
                    self.step += 1
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.title3)
                }
                .padding(.horizontal, 150)
                .padding(.vertical, 5)
                .background(modelData.attendantMode ? Color.init(hex:"D33846") : Color.init(hex: "0E57BD")).clipShape(RoundedRectangle(cornerRadius: 8.0))
                Spacer()
            }
        }.background(
            Image("backgroundImg3")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .colorMultiply(Color.init(hex: "d3d3d3"))
                .saturation(0.5)
        )
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(step: .constant(1))
            .environmentObject(ModelData())
    }
}

//
//  ContentView.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    @State var selectedTab = 2
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(hexString: "#FFFFFF")
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("American")
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                    Image("aaLogo")
                    Spacer()
                }
                .padding(.leading, 25)
                
                ZStack(alignment: Alignment.bottom) {
                    TabView(selection: $selectedTab) {
                        GetBuff()
                            .background(BackgroundHelper())
                            .tabItem {
                                Text("")
                            }.tag(0)
                        Diedrate()
                            .background(BackgroundHelper())
                            .tabItem {
                                Text("")
                            }
                            .tag(1)
                            .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 8.0)))
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .padding(.top, 20)
                            .padding(.bottom, 40)
                        Text("plane")
                            .background(BackgroundHelper())
                            .tabItem {
                                Text("")
                            }.tag(2)
                        Snooze()
                            .background(BackgroundHelper())
                            .tabItem {
                                Text("")
                            }.tag(3)
                        SendHelp()
                            .background(BackgroundHelper())
                            .tabItem {
                                Text("")
                            }.tag(4)
                    }
                    HStack {
                        Button(action: { self.selectedTab = 0 }) {
                            Image(selectedTab == 0 ? "exerciseIconSelected" : "exerciseIcon")
                        }
                        .frame(maxWidth: .infinity)
                        Button(action: { self.selectedTab = 1 }) {
                            Image(selectedTab == 1 ? "waterIconSelected" : "waterIcon")
                        }
                        .frame(maxWidth: .infinity)
                        Button(action: { self.selectedTab = 2 }) {
                            Image(selectedTab == 2 ? "planeIconSelected" : "planeIcon")
                        }
                        .frame(maxWidth: .infinity)
                        Button(action: { self.selectedTab = 3 }) {
                            Image(selectedTab == 3 ? "moonIconSelected" : "moonIcon")
                        }
                        .frame(maxWidth: .infinity)
                        Button(action: { self.selectedTab = 4 }) {
                            Image(selectedTab == 4 ? "alarmIconSelected" : "alarmIcon")
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .padding(.top, 22)
                    .frame(maxHeight: 54)
                    .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 8.0)))
                    .edgesIgnoringSafeArea(.all)
                }
            }
        }
        .background(
            Image("backgroundImg3")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

struct BackgroundHelper: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            // find first superview with color and make it transparent
            var parent = view.superview
            repeat {
                if parent?.backgroundColor != nil {
                    parent?.backgroundColor = UIColor.clear
                    break
                }
                parent = parent?.superview
            } while (parent != nil)
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

//
//  ContentView.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    @State var selectedTab = 0
    let backgroundImages = ["backgroundImg1", "backgroundImg2", "backgroundImg3", "backgroundImg4", "backgroundImg5", "backgroundImg6"]
    @State var activeImageIndex = 0
    let imageSwitchTimer = Timer.publish(every: 30, on: .main, in: .common).autoconnect()
    
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.white
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
                            }
                            .tag(0)
                            .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 8.0)))
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .padding(.top, 20)
                            .padding(.bottom, 40)
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
            Image(backgroundImages[activeImageIndex])
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .animation(.easeInOut)
                .onReceive(imageSwitchTimer) { _ in
                    self.activeImageIndex = (self.activeImageIndex + 1) % self.backgroundImages.count
                }
                .colorMultiply(Color.init(hex: "d3d3d3"))
                .saturation(0.5)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
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

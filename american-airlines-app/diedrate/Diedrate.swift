//
//  Diedrate.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.


import SwiftUI
import ConfettiSwiftUI


struct Diedrate: View {
    @EnvironmentObject var modelData: ModelData
    @State var counter: Int = 0
    @State var firstPage: Bool = true
    
    var body: some View {
        VStack {
            HStack {
                Text("Water Tracker")
                    .font(Font.title2.weight(.semibold))
                    .foregroundColor(Color.init(hex: "0E57BD"))
                    .padding()
                Spacer()
            }
            
            if (!firstPage) {
                HStack {
                    Text("2000ml")
                        .foregroundColor(Color.blue)
                        .padding(.vertical)
                        .padding(.leading, 45)
                    Spacer()
                }
                ZStack {
                    MyLinesStatic(startX: 70, startY: 0, endY: 425, strokeColor: Color.blue)
                    MyLines(startX: 70, startY: 0, endY: 425, strokeColor: Color.init(hex: "c5d7ef"))
                    HStack {
                        Button(action: { self.firstPage.toggle() }) {
                            Image("leftArrow")
                                .padding(.bottom, 90)
                                .padding(.trailing, 180)
                        }
                        VStack {
                            Button(action: {
                                var cur = modelData.intake.curIntake
                                let needed = modelData.intake.neededIntake
                                
                                if (cur < needed) {
                                    modelData.intake.curIntake += 250
                                    cur += 250
                                }
                                if (cur >= needed) {
                                    counter += 1
                                }
                            }) {
                                VStack {
                                    Image("halfShot")
                                    Text("250ml")
                                }
                            }
                            Button(action: {
                                var cur = modelData.intake.curIntake
                                let needed = modelData.intake.neededIntake
                                
                                if (cur < needed) {
                                    modelData.intake.curIntake += 500
                                    cur += 500
                                }
                                if (cur >= needed) {
                                    counter += 1
                                }
                            }) {
                                VStack {
                                    Image("shot")
                                    Text("500ml")
                                }
                            }
                            
                            Button(action: {
                                modelData.intake.curIntake = 0
                            }) {
                                Text("Reset")
                            }
                            .offset(x: 100)
                        }
                        .offset(x:-55)
                    }
                    ConfettiCannon(counter: $counter, num: 100, colors: [.red, .white, .blue])
                }
            } else {
                HStack {
                    Text("2000ml")
                        .foregroundColor(Color.blue)
                        .padding()
                    Spacer()
                }
                ZStack {
                    MyLinesStatic(startX: 45, startY: 425, endY: 0, strokeColor: Color.init(hex: "c5d7ef"))
                    MyLines(startX: 45, startY: 425, endY: 0, strokeColor: Color.blue)
                    HStack {
                        VStack {
                            Text("Staying Hydrated")
                                .font(Font.title3.weight(.semibold))
                                .foregroundColor(Color.init(hex: "0E57BD"))
                            Text("\nIt’s important to stay hydrated, especially on airplanes where high altitudes can make one dehydrated! The Aerospace Medical Association recommends drinking about 250 ml of water per hour while on a plane.\n\nBased on the duration of your flight, we recommend you drink \(modelData.intake.neededIntake) ml!")
                                .font(.system(size: 13))
                                .foregroundColor(Color.init(hex: "0e57bd"))
                                .padding(.leading, 12)
                                .padding(.trailing, 3)
                                .opacity(0.6)
                        }
                        .frame(minWidth: 210, maxWidth: 210, minHeight: 0, maxHeight: .infinity)
                        .background(Color.init(hex: "007AFF").opacity(0.1).clipShape(RoundedRectangle(cornerRadius: 8.0)))
                        .padding(.top, 30)
                        .padding(.bottom, 140)
                        .padding(.leading, 60)
                        .padding(.trailing, 20)
                        
                        Button(action: {
                            self.firstPage.toggle()
                        }) {
                            Image("rightArrow")
                                .padding(.bottom, 90)
                        }
                    }
                }
            }
        }
    }
}

struct Diedrate_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        Diedrate()
            .environmentObject(modelData)
    }
}

struct MyLines: View {
    @EnvironmentObject var modelData: ModelData
    
    var startX: CGFloat
    var startY: CGFloat
    var endY: CGFloat
    var strokeColor: Color
    
    var body: some View {
        
        var percentage = (CGFloat) (modelData.intake.neededIntake - modelData.intake.curIntake) / CGFloat(modelData.intake.neededIntake)
        
        Path { path in
            path.move(to: CGPoint(x: startX, y: startY))
            path.addLine(to: CGPoint(x: startX, y: endY))
        }
        .trim(from: 0, to: percentage) // << breaks path by parts, animatable
        .stroke(strokeColor, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        .animation(.easeOut(duration: 1.0)) // << animate
        .onAppear {
            percentage = 1.0 // << activates animation for 0 to the end
        }
    }
}

struct MyLinesStatic: View {
    @EnvironmentObject var modelData: ModelData
    
    var startX: CGFloat
    var startY: CGFloat
    var endY: CGFloat
    var strokeColor: Color
    
    @State private var percentage: CGFloat = .zero
    
    var body: some View {
        
        Path { path in
            path.move(to: CGPoint(x: startX, y: startY))
            path.addLine(to: CGPoint(x: startX, y: endY))
        }
        .trim(from: 0, to: percentage) // << breaks path by parts, animatable
        .stroke(strokeColor, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        .onAppear {
            self.percentage = 1.0 // << activates animation for 0 to the end
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
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
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

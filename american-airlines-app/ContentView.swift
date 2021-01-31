//
//  ContentView.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import SwiftUI
import Foundation


struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    let backgroundImages = ["backgroundImg1", "backgroundImg2", "backgroundImg3", "backgroundImg4", "backgroundImg5", "backgroundImg6"]
    @State var activeImageIndex = 3
    let imageSwitchTimer = Timer.publish(every: 30, on: .main, in: .common).autoconnect()
    @State var selectedTab = 2
    @State var planeImg: Image = Image("aaLogo")
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().backgroundColor = UIColor.white
        
    }
    
    
    func getMapUrl(text:String) -> String {
        let pattern = #"(?<=fvPublicSiteFT)(.*?)(?=">)"#
        let regex = try! NSRegularExpression(pattern: pattern, options: .anchorsMatchLines)
        let stringRange = NSRange(location: 0, length: text.utf16.count)
        let mapstring = regex.firstMatch(in: text, range: stringRange)
        let r = mapstring?.range
        let matchStr = (text as NSString).substring(with: r!)
        
        //        let timeRemPat = #"(?<=Time Remaining:)(.*?)(?=">)"#
        return matchStr.replacingOccurrences(of: "&amp;", with: "&")
    }
    
    
    
    
    func downloadImage(from: URL) {
        
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
                        PlaneView(pImg: planeImg)
                            .background(BackgroundHelper())
                            .tabItem {
                                Text("")
                            }.tag(2)
                        Snooze()
                            .background(BackgroundHelper())
                            .tabItem {
                                Text("")
                            }.tag(3)
                        Attendant()
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
                        Button(action: {
                            let url = URL(string: "https://www.flightview.com/TravelTools/FlightTrackerQueryResults.asp?qtype=sfi&sfw=%2FFV%2FTravelTools%2FMain&whenArrDep=dep&namal=AA+American+Airlines&al=AA&fn=" + modelData.fn + "&whenDate=" + modelData.date + "&input=Track+Flight")
                            
                            
                            self.selectedTab = 2
                            let request = NSMutableURLRequest(url: url! as URL)
                            let session = URLSession.shared
                            
                            request.httpMethod = "GET"
                            request.addValue("User-Agent", forHTTPHeaderField: "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.76 Safari/537.36")
                            request.addValue("Upgrade-Insecure-Requests", forHTTPHeaderField: "1")
                            request.addValue("DNT", forHTTPHeaderField: "1")
                            request.addValue("Accept", forHTTPHeaderField: "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8")
                            request.addValue("Accept-Language", forHTTPHeaderField: "en-US,en;q=0.5")
                            request.addValue("Accept-Encoding", forHTTPHeaderField: "gzip, deflate")
                            
                            
                            
                            let task = session.dataTask(with: request as URLRequest) {
                                data, response, error in guard let data = data else {return}
                                do {
                                    let contents = String(data: data, encoding: String.Encoding.utf8)
                                    
                                    
                                    //                                    print(contents)
                                    let parsedMapStr =  getMapUrl(text: contents!)
                                    let mapUrl = URL(string: "https://www.flightview.com/fvPublicSiteFT" + parsedMapStr)
                                    print(mapUrl)
                                    let maptask = session.dataTask(with: mapUrl!) {(data, resp, error) in
                                        if let e = error {
                                            print("Error retrievinng map photo: \(e)")
                                        } else {
                                            if let res = resp as? HTTPURLResponse {
                                                print("downloaed pic data with code \(res.statusCode)")
                                                if let imageData = data {
                                                    let image = UIImage(data: imageData)
                                                    //                                                    modelData.planeImg = Image(uiImage: image!)
                                                    //                                                    modelData.planeImg = Image("alarmIcon")
                                                    planeImg = Image(uiImage: image!)
                                                } else {
                                                    print("Couldnnt get image, it is nil")
                                                }
                                            } else {
                                                print("couldnt get response code")
                                            }
                                        }
                                        
                                    }
                                    maptask.resume()
                                    
                                    
                                } catch let error {
                                    print(error.localizedDescription)
                                }
                                
                            }
                            task.resume()
                            
                        }) {
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
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(ModelData())
        }
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


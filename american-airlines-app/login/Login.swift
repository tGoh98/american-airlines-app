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
    @State var goToLogin: Bool = true
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
                    modelData.fn = flightNum
                    let df: DateFormatter = DateFormatter()
                    df.dateFormat = "yyyyMMdd"
                    modelData.date = df.string(from: Date.init())
                    print(modelData.date)
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

//func getMapUrl(text:String) -> String {
//    let pattern = #"(?<=fvPublicSiteFT)(.*?)(?=">)"#
//    let regex = try! NSRegularExpression(pattern: pattern, options: .anchorsMatchLines)
//    let stringRange = NSRange(location: 0, length: text.utf16.count)
//    let mapstring = regex.firstMatch(in: text, range: stringRange)
//    let r = mapstring?.range
//    let matchStr = (text as NSString).substring(with: r!)
//
//    return matchStr.replacingOccurrences(of: "&amp;", with: "&")
//}

//
//func downloadImage(fn: String, date: String) {
//    let url = URL(string: "https://www.flightview.com/TravelTools/FlightTrackerQueryResults.asp?qtype=sfi&sfw=%2FFV%2FTravelTools%2FMain&whenArrDep=dep&namal=AA+American+Airlines&al=AA&fn="+fn + "&whenDate=" + date + "&input=Track+Flight")
//
//        let request = NSMutableURLRequest(url: url! as URL)
//    let session = URLSession.shared
//
//    request.httpMethod = "GET"
//    request.addValue("User-Agent", forHTTPHeaderField: "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.76 Safari/537.36")
//    request.addValue("Upgrade-Insecure-Requests", forHTTPHeaderField: "1")
//    request.addValue("DNT", forHTTPHeaderField: "1")
//    request.addValue("Accept", forHTTPHeaderField: "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8")
//    request.addValue("Accept-Language", forHTTPHeaderField: "en-US,en;q=0.5")
//    request.addValue("Accept-Encoding", forHTTPHeaderField: "gzip, deflate")
//
//
//
//    let task = session.dataTask(with: request as URLRequest) {
//        data, response, error in guard let data = data else {return}
//        do {
//            let contents = String(data: data, encoding: String.Encoding.utf8)
//            let parsedMapStr =  getMapUrl(text: contents!)
//            let mapUrl = URL(string: "https://www.flightview.com/fvPublicSiteFT" + parsedMapStr)
//            print(mapUrl)
//            let maptask = session.dataTask(with: mapUrl!) {(data, resp, error) in
//                if let e = error {
//                    print("Error retrievinng map photo: \(e)")
//                } else {
//                    if let res = resp as? HTTPURLResponse {
//                        print("downloaed pic data with code \(res.statusCode)")
//                        if let imageData = data {
//                            let image = UIImage(data: imageData)
//                            //                                                    modelData.planeImg = Image(uiImage: image!)
//                            //                                                    modelData.planeImg = Image("alarmIcon")
////                            return Image(uiImage: image!)
//                        } else {
//                            print("Couldnnt get image, it is nil")
//                        }
//                    } else {
//                        print("couldnt get response code")
//                    }
//                }
//
//            }
//            maptask.resume()
//
//
//        } catch let error {
//            print(error.localizedDescription)
//        }
//
//    }
//    task.resume()
//
//}



struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(step: .constant(1))
            .environmentObject(ModelData())
    }
}

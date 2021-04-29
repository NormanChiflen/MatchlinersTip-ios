////
////  preferenceView.swift
////  UnderDog Prototype
////
////  Created by John Lee on 4/27/21.
////
//
//import SwiftUI
//
//struct preferenceView: View{
//    @State var email: String = ""
//    @State var displayName: String = ""
//    @State var state: String = ""
//    @State var age: Int = 0
//    @State var NCAAF: Bool = false
//    @State var AFL: Bool = false
//    @State var MLB: Bool = false
//    @State var NBA: Bool = false
//    @State var NHL: Bool = false
//    @State var Euroleague: Bool = false
//    @State var MMA: Bool = false
//    @State var Rugby: Bool = false
//    @State var EPL: Bool = false
//    @State var MLS: Bool = false
//    
//
//    let columns = [
//        GridItem(.adaptive(minimum: 100))
//    ]
//    
//    
//    var body: some View {
//        
//        VStack(alignment: .center, spacing: 10){
//            Spacer()
//            Text("Preference")
//                .font(.custom("NotoSans-Medium", size: 22))
//                .foregroundColor(Color.gray)
//                .padding()
//            Text("Setting up your preference will send you directly to bets that make sense for you")
//                .font(.custom("NotoSans-Medium", size: 15))
//                .foregroundColor(Color.gray)
//                .padding()
//            Menu{
//                Menu{
//                    Toggle(isOn: $NCAAF, label: {
//                        Text("NCAAF 🇺🇸")
//                    })
//                    .padding()
//                    Toggle(isOn: $AFL, label: {
//                        Text("AFL 🇦🇺")
//                    })
//                }label: {
//                    Text("Football 🏈")
//                }
//                Menu{
//                    Button("EPL 🇬🇧") {
//                        EPL = true
//                    }
//                }label: {
//                    Text("Soccer ⚽")
//                }
//                Menu{
//                    Button("NBA 🇺🇸") {
//                        NBA = true
//                    }
//                    Button("Euro League 🇪🇺"){
//                        Euroleague = true
//                    }
//                }label: {
//                    Text("Basketball 🏀")
//               }
//                Menu{
//                    Button("MLB 🇺🇸") {
//                        MLB = true
//                    }
//                }label: {
//                    Text("Baseball ⚾")
//               }
//                Menu{
//                    Button("NHL 🇺🇸") {
//                        NHL = true
//                    }
//                }label: {
//                    Text("Ice Hockey 🏒")
//               }
//                Menu{
//                    Button("MMA 🥋") {
//                        MMA = true
//                    }
//                }label: {
//                    Text("MMA 🥋")
//               }
//                Menu{
//                    Button("NRL 🇦🇺") {
//                        Rugby = true
//                    }
//                }label: {
//                    Text("Rugby 🏉")
//               }
//
//            }label: {
//                Label("Sports", systemImage: "sportscourt")
//                    .accentColor(.blue)
//                    .font(.system(size: 22, weight: .semibold))
//           }
//            Spacer()
//            Spacer()
//            Spacer()
//            Spacer()
//            Spacer()
//            ScrollView{
//                LazyVGrid(columns: columns){
//                    Toggle(isOn: $NCAAF, label: {
//                        Text("NCAAF 🇺🇸")
//                    })
//                    .padding()
//                    .toggleStyle(CheckboxStyle())
//                    Toggle(isOn: $AFL, label: {
//                        Text("AFL 🇦🇺")
//                    })
//                    .padding()
//                    .toggleStyle(CheckboxStyle())
//                    Toggle(isOn: $MLB, label: {
//                        Text("MLB 🇺🇸")
//                    })
//                    .padding()
//                    .toggleStyle(CheckboxStyle())
//                    Toggle(isOn: $NBA, label: {
//                        Text("NBA 🇺🇸")
//                    })
//                    .padding()
//                    .toggleStyle(CheckboxStyle())
//                    Toggle(isOn: $Euroleague, label: {
//                        Text("Euro League 🇪🇺")
//                    })
//                    .padding()
//                    .toggleStyle(CheckboxStyle())
//                    Toggle(isOn: $NHL, label: {
//                        Text("NHL 🇺🇸")
//                    })
//                    .padding()
//                    .toggleStyle(CheckboxStyle())
//                    Toggle(isOn: $MMA, label: {
//                        Text("MMA 🥋")
//                    })
//                    .padding()
//                    .toggleStyle(CheckboxStyle())
//                    Toggle(isOn: $Rugby, label: {
//                        Text("NRL 🇦🇺")
//                    })
//                    .padding()
//                    .toggleStyle(CheckboxStyle())
//                    Toggle(isOn: $EPL, label: {
//                        Text("EPL 🇬🇧")
//                    })
//                    .padding()
//                    .toggleStyle(CheckboxStyle())
//                    Toggle(isOn: $MLS, label: {
//                        Text("MLS 🇺🇸")
//                    })
//                    .padding()
//                    .toggleStyle(CheckboxStyle())
//                }
//            }
//    
//        }
//    }
//}
//
//struct CheckboxStyle: ToggleStyle {
// 
//    func makeBody(configuration: Self.Configuration) -> some View {
// 
//        return HStack {
// 
//            configuration.label
// 
////            Spacer()
// 
//            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
//                .resizable()
//                .frame(width: 20, height: 20)
//                .foregroundColor(configuration.isOn ? .purple : .gray)
//                .font(.system(size: 10, weight: .bold, design: .default))
//                .onTapGesture {
//                    configuration.isOn.toggle()
//                }
//        }
// 
//    }
//}
//
//struct preferenceView_Previews: PreviewProvider {
//    static var previews: some View {
//        preferenceView()
//    }
//}

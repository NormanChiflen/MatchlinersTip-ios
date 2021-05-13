//
//  UpdatePreferenceView.swift
//  UnderDog Prototype
//
//  Created by Oscar Gao on 5/5/21.
//

import SwiftUI

struct UpdatePreferenceView: View {
    @EnvironmentObject var session: SessionStore

    @State var NFL: Bool = false
    @State var AFL: Bool = true
    @State var MLB: Bool = false
    @State var NBA: Bool = false
    @State var NHL: Bool = false
    @State var Euroleague: Bool = false
    @State var MMA: Bool = false
    @State var NRL: Bool = false
    @State var EPL: Bool = false
    @State var MLS: Bool = false

    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]

    var body: some View {

        VStack(alignment: .center, spacing: 10){
            Spacer()
            Text("Update Your Preference")
                .font(.custom("NotoSans-Medium", size: 22))
                .foregroundColor(Color.black)
                .padding()
            Menu{
                Menu{
                    Toggle(isOn: $NFL, label: {
                        Text("NFL 🇺🇸")
                    })
                    .padding()
                    Toggle(isOn: $AFL, label: {
                        Text("AFL 🇦🇺")
                    })
                }label: {
                    Text("Football 🏈")
                }
                Menu{
                    Button("EPL 🇬🇧") {
                        EPL = true
                    }
                }label: {
                    Text("Soccer ⚽")
                }
                Menu{
                    Button("NBA 🇺🇸") {
                        NBA = true
                    }
                    Button("Euro League 🇪🇺"){
                        Euroleague = true
                    }
                }label: {
                    Text("Basketball 🏀")
               }
                Menu{
                    Button("MLB 🇺🇸") {
                        MLB = true
                    }
                }label: {
                    Text("Baseball ⚾")
               }
                Menu{
                    Button("NHL 🇺🇸") {
                        NHL = true
                    }
                }label: {
                    Text("Ice Hockey 🏒")
               }
                Menu{
                    Button("MMA 🥋") {
                        MMA = true
                    }
                }label: {
                    Text("MMA 🥋")
               }
                Menu{
                    Button("NRL 🇦🇺") {
                        NRL = true
                    }
                }label: {
                    Text("Rugby 🏉")
               }

            }label: {
                Label("Sports", systemImage: "sportscourt")
                    .accentColor(.blue)
                    .font(.system(size: 22, weight: .semibold))
           }
            Spacer()
            ScrollView{
                LazyVGrid(columns: columns){
                    Toggle(isOn: $NFL, label: {
                        Text("NFL 🇺🇸")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                    Toggle(isOn: $AFL, label: {
                        Text("AFL 🇦🇺")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                    Toggle(isOn: $MLB, label: {
                        Text("MLB 🇺🇸")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                    Toggle(isOn: $NBA, label: {
                        Text("NBA 🇺🇸")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                    Toggle(isOn: $Euroleague, label: {
                        Text("Euro League 🇪🇺")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                    Toggle(isOn: $NHL, label: {
                        Text("NHL 🇺🇸")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                    Toggle(isOn: $MMA, label: {
                        Text("MMA 🥋")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                    Toggle(isOn: $NRL, label: {
                        Text("NRL 🇦🇺")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                    Toggle(isOn: $EPL, label: {
                        Text("EPL 🇬🇧")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                    Toggle(isOn: $MLS, label: {
                        Text("MLS 🇺🇸")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                }
            }
            Button(action: session.signOut, label: {
                Text("Place-Holder Button").padding()
            })
            .buttonStyle(largeButton())

        }
        .onAppear{
            let thisPref = session.pref
            NFL = thisPref!.NFL
            AFL = thisPref!.AFL
            MLB = thisPref!.MLB
            NBA = thisPref!.NBA
            NHL = thisPref!.NHL
            Euroleague = thisPref!.Euroleague
            MMA = thisPref!.MMA
            NRL = thisPref!.NRL
            EPL = thisPref!.EPL
            MLS = thisPref!.MLS
        }
        .onDisappear{
            
        }
    }
}

struct UpdatePreferenceView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatePreferenceView()
    }
}

//
//  ContentView.swift
//  Shared
//
//  Created by John Lee on 2/27/21.
//
//import SwiftUICharts
import iLineChart
import SwiftUI
import Firebase

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    func getUser() {
        session.listen()
    }
    var body: some View {
        Group {
            if(session.session != nil){
                LoggedInView()
            } else {
                AuthView()
            }
        }.onAppear(perform: getUser)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}

struct LoggedInView : View {
    @EnvironmentObject var session: SessionStore
    
    var body: some View{
        VStack{
            iLineChart(
                data: [8,32,11,23,40,28,15,20,30,25],
                title: "Betting Amount",
                subtitle: "$1XX,XXX.00",
                chartBackgroundGradient: GradientColor.bluPurpl,
                displayChartStats: true
            )
                .frame(height: 400)
            HStack(spacing: 35){
                Button(action: {print("1D")} ){
                    Text("1D")
                }
                Button(action: {print("1W")} ){
                    Text("1W")
                }
                Button(action: {print("1M")} ){
                    Text("1M")
                }
                Button(action: {print("3M")} ){
                    Text("3M")
                }
                Button(action: {print("1Y")} ){
                    Text("1Y")
                }
                Button(action: {print("ALL")} ){
                    Text("ALL")
                }
            }
                .foregroundColor(.black)
                .background(Color("Button Color"))
                .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(Color("Button Color"), lineWidth: 4))
                .font(.custom("NotoSans-Medium", size: 18))
                .padding()
            Button(action: session.signOut){
                Text("Sign Out")
            }
        }
        .padding()
    }
}

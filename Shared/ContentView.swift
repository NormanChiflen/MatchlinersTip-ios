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
import UIKit

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
    @State private var selection = 0
    
    //Home Screen//
    var body: some View{
        TabView(selection: $selection) {
            HomeTabView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
                .tag(0)
         
            Text("Bookmark Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
         
            Text("Video Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "list.bullet")
                }
                .tag(2)
         
            ProfileTabView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }
                .tag(3)
        }.onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
        .accentColor(.neonGreen)
    }
}

struct HomeTabView : View {
    @EnvironmentObject var session: SessionStore
    var body: some View{
        VStack{
            iLineChart(
                data: [8,32,11,23,40,28,15,20,30,25],
                title: "Betting Amount",
                subtitle: "$1XX,XXX.00",
                lineGradient: GradientColor.bluPurpl,
                chartBackgroundGradient: nil,
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
        }
        .padding()

    }
}

struct ProfileTabView: View {
    @EnvironmentObject var session: SessionStore
    var body: some View {
//         Sign out button
        Button(action: session.signOut){
            Text("Sign Out")
        }
    }
}

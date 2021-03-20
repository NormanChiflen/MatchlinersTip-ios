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

//Emcompases all users functions
//Navigate with TabView
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

            Text("Popular Events")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)

            Text("Betting History")
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

//
struct HomeTabView : View {
    @EnvironmentObject var session: SessionStore
    
    @State var showTable = false;
    //Example
    @State var rows: [GridItem] =
            Array(repeating: .init(.fixed(5)), count: 2)
    ///
    func displayTable() {
        withAnimation{
            self.showTable.toggle()
        }
        
    }
    var body: some View{
        
        List{
        VStack{
            iLineChart(
                data: [25,25,26,26,26,26,24,24,30,20,35,35,35],
                title: "Betting Amount",
                subtitle: "$1XX,XXX.00",
                lineGradient:  GradientColor.green,
                displayChartStats: true,
                titleFont: .system(size: 30, weight: .bold, design: .rounded)
            )
                .frame(height: 400)
            HStack{
                Group {
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
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            }
                .foregroundColor(.black)
                .background(Color("Button Color"))
                .overlay(RoundedRectangle(cornerRadius: 6)
                    .stroke(Color("Button Color"), lineWidth: 4))
                .font(.custom("NotoSans-Medium", size: 18))
                
            //Ongoing Bets
            VStack{
                Button(action: displayTable, label: {
                    HStack(){
                        Text("Ongoing Bets")
                            .font(.custom("NotoSans-Medium", size: 25))
                        if(self.showTable == false){
                        Text("▼")
                        }else {
                            Text("▲")
                        }
                    }
                    .alignmentGuide(.leading){
                        d in d[.trailing]
                    }
                    .offset(x: 98.0, y: 5.0)
                    .padding()
                })
                    .foregroundColor(.black)
                    .frame(width: .infinity, height: 50, alignment: .leading)
                if self.showTable == true {
                    OngoingBets()
                        .transition(.scale)
                }
            }
                .padding()
            Spacer()
            Divider()
            //Upcoming Bets
            VStack{
                Text("Upcoming Bets")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(x: -5.0, y: 5.0)
                    .font(.custom("NotoSans-Medium", size: 25))
            }
            List {
                VStack(spacing: 20) {
                    ForEach(0..<10) {
                        Text("Item \($0)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(width: 290, height: 150)
                            .background(Color.gray)
                    }
                }
            }
            .frame(height: 350)
            .padding()
            Divider()
        }
        .padding()
    }
    
    }

}

//Work on this once we have data
struct OngoingBets: View {
    var body: some View{
        Text("SF Giants @ LA Dodgers")
    }
}

struct ProfileTabView: View {
    @EnvironmentObject var session: SessionStore
    var body: some View {
//         Sign out button
        VStack{
        Text("Account")
            .font(.system(size: 30, weight: .bold, design: .rounded))
            List{
                Text("Cashier")
                Text("Settings")
                Text("Help")
                Button(action: session.signOut){
                    Text("Sign Out")
                }
            }
        }

    }
}

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
import Foundation

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
    @State var searchText = ""
    //Home Screen//
    var body: some View{
        TabView(selection: $selection) {
            HomeTabView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
                .tag(0)
            PopularEventsView(text: $searchText)
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

struct HomeTabView : View {
    @State var games: [Datum] = []
    @EnvironmentObject var session: SessionStore
    @State var showTable = false
    //Example
    func displayTable() {
        withAnimation{
            self.showTable.toggle()
        }
    }
    var body: some View {
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
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 30, maxHeight: 30)
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
                
                Text("Upcoming Bets")
                    .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(x: -5.0, y: 5.0)
                            .font(.custom("NotoSans-Medium", size: 25))
                    .padding()
                
                    EPL()
                
            }
        }
    }
}

//Work on this once we have data
struct OngoingBets: View {
    var body: some View{
        Text("SF Giants @ LA Dodgers")
    }
}
struct PopularEventsView: View {
    @State var posts: [Initial.Datas] = []
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        VStack{
            Text("Popular Events")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .padding()
            HStack {
                    TextField("Search ...", text: $text)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 8)
                         
                                if isEditing {
                                    Button(action: {
                                        self.text = ""
                                    }) {
                                        Image(systemName: "multiply.circle.fill")
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 8)
                                    }
                                }
                            }
                        )
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            self.isEditing = true
                        }
         
                    if isEditing {
                        Button(action: {
                            self.isEditing = false
                            self.text = ""
         
                        }) {
                            Text("Cancel")
                        }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        .animation(.default)
                    }
            }
            List(posts) { post in
                Text(post.title)
            }
            .onAppear{
                OddsApi().getPosts {
                    (posts) in
                    self.posts = posts
                }
            }
        }
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

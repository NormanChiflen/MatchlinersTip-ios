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
        }
        .accentColor(.neonGreen)
    }
}

struct HomeTabView : View {
    @State var games: [Datum] = []
    @EnvironmentObject var session: SessionStore
    @State var showTable = false
    @Environment(\.colorScheme) var colorScheme
    @State private var bottomSheetShown = false
    @State private var hidesheet = false
    @State var gamed = Datum(id: "", sportKey: "", sportNice: "", teams: [], commenceTime: 0, homeTeam: "", sites: [], sitesCount: 0)
    //Example
    func displayTable() {
        withAnimation{
            self.showTable.toggle()
        }
    }
    var body: some View {
       
        ZStack{
        List{
            VStack{
                
                let balance = "$ \(session.profile?.score.description ?? "?")"
                if(colorScheme == .dark){
                    iLineChart(
                        data: [25,25,26,26,26,26,24,24,30,20,35,35,35],
                        title: session.profile?.displayName,
                        subtitle: balance,
                        style: .dark,
                        lineGradient:  GradientColor.green,
                        titleColor: Color.neonRed,
                        displayChartStats: true,
                        titleFont: .system(size: 30, weight: .bold, design: .rounded),
                        subtitleFont: .system(size: 24, weight: .bold, design: .monospaced)
                    )
                        .frame(height: 400)
                }
                else{
                    iLineChart(
                        data: [25,25,26,26,26,26,24,24,30,20,35,35,35],
                        title: session.profile?.displayName,
                        subtitle: balance,
//                        style: .tertiary,
                        lineGradient:  GradientColor.green,
                        displayChartStats: true,
                        titleFont: .system(size: 30, weight: .bold, design: .rounded),
                        subtitleFont: .system(size: 24, weight: .bold, design: .monospaced)
                    )
                    .frame(height: 400)
                }
                Divider()
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
                //Show all games that matches with preference
//                UpComing(gamed: $gamed, bottomSheetShown: $bottomSheetShown)
//                .padding()
            }
        
        }
            if (bottomSheetShown != false) {
                GeometryReader{ geometry in
                    BottomSheetView(isOpen: self.$bottomSheetShown, maxHeight: 700) {
                        VStack {
                            HStack{
                                Spacer()
                                VStack{
                                    Text("Teams")
                                    Divider()
                                    Text(gamed.teams[0])
                                        .font(.system(size: 15))
                                    Divider()
                                    Text(gamed.teams[1])
                                        .font(.system(size: 15))
                                }
                                .background(Color("Custom Color 1"))
                                .cornerRadius(5)
                                Spacer()
                                VStack{
                                    Text("Win")
                                    Divider()
                                    Text("\(gamed.sites[0].odds.h2H[0], specifier: "%.2f")")
                                    Divider()
                                    Text("-\(gamed.sites[0].odds.h2H[0], specifier: "%.2f")")
                                }
                                .background(Color("Button Color"))
                                .cornerRadius(5)
                                Spacer()
                                VStack{
                                    Text("Lost")
                                    Divider()
                                    Text("-\(gamed.sites[0].odds.h2H[1], specifier: "%.2f")")
                                    Divider()
                                    Text("\(gamed.sites[0].odds.h2H[1], specifier: "%.2f")")
                                }
                                .background(Color("Custom Color 2"))
                                .cornerRadius(5)
                                Spacer()
                            }
                        }
                        .padding(geometry.safeAreaInsets)
//                        Rectangle().fill(Color("Button Color").opacity(0.2))
                    }.edgesIgnoringSafeArea(.all)
                    }
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
//            .onAppear{
//                OddsApi().getPosts {
//                    (posts) in
//                    self.posts = posts
//                }
//            }
        }
    }
}

struct ProfileTabView: View {
    @EnvironmentObject var session: SessionStore
    var body: some View{
//         Sign out butto
        NavigationView{
            VStack {
                List{
                    NavigationLink (destination: UpdatePasswordView())
                        { Text("Update Password")}
                    NavigationLink (destination: ContactSupportView())
                        {Text("Contact Support")}
                    NavigationLink (destination: SportsBetting101View())
                        {Text("Sports Betting 101")}
                    NavigationLink (destination: DarkModeView())
                        {Text("Light/Dark Mode")}
                    NavigationLink(
                        destination: BettingView()){
                        Text("Betting Calculator")
                        }
                    Button(action: session.signOut){
                        Text("Sign Out")
                            }
                        }
                    Spacer()
                }
            .navigationBarTitle("Amount")
        }
    }
}

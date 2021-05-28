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
            SearchEventsView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            ArchiveView()
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
    @State private var Odds = 0
    @State var OddsAmount = []
    @State private var hidesheet = false
    @State var gamed = Datum(id: "", sportKey: "", sportNice: "", teams: [], commenceTime: 0, homeTeam: "", sites: [], sitesCount: 0)
    var ScoreHistory: [Double] {
        var history = [Double]()
        history = [25,25,26,26,26,26,24,24,30,20,35,35,35]
        return history
    }
    var buyingPower: Double{
        var bp = Double(session.profile?.score ?? 0)
        var aggregate: Double = 0
        session.onGoingBets.forEach{
            bet in
            aggregate += Double(bet.value) ?? 0
        }
        bp = bp - aggregate
        return bp
    }
//    [25,25,26,26,26,26,24,24,30,20,35,35,35]
    func displayTable() {
        withAnimation{
            self.showTable.toggle()
        }
    }
    var gameEnded: [String] {
        var result = [String]()
        var ended = true
        session.onGoingBets.forEach { bet in
            games.forEach { game in
                if game.id == bet.id {
                    ended = false
                }
            }
            if ended == false {
                
                let empty = ""
                result.append(empty)
            }
            if ended == true{
                //If a game ended, create a list of games ended
                let answer = "\(bet.team_Name1) at " + "\(bet.team_Name2)"
                result.append(answer)
            }
            ended = true
        }
        return result
    }
    var body: some View {
       
        ZStack{
            List{
                VStack{
                    let balance = "$ \(session.profile?.score.description ?? "?")"
                    if(colorScheme == .dark){
                        iLineChart(
                            data: ScoreHistory,
                            title: session.profile?.displayName,
                            subtitle: balance,
                            style: .dark,
                            lineGradient:  GradientColor.green,
                            titleColor: Color.neonRed,
                            curvedLines: false,
                            displayChartStats: true,
                            titleFont: .system(size: 30, weight: .bold, design: .rounded),
                            subtitleFont: .system(size: 24, weight: .bold, design: .monospaced)
                        )
                            .frame(height: 400)
                    }
                    else{
                        iLineChart(
                            data: ScoreHistory,
                            title: session.profile?.displayName,
                            subtitle: balance,
                            style: .tertiary,
                            lineGradient:  GradientColor.green,
                            curvedLines: false,
                            displayChartStats: true,
                            titleFont: .system(size: 30, weight: .bold, design: .rounded),
                            subtitleFont: .system(size: 24, weight: .bold, design: .monospaced)
                        )
                        .frame(height: 400)
                    }
                    Divider()
                    VStack{
                        HStack{
                            Text("Buying Power: ")
                                .font(.custom("NotoSans-Bold", size: 20))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .offset(x: 15.0, y: 5.0)
                            Text("$\(buyingPower,specifier:"%.2f")")
                                .bold()
                        }
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
                        })
                            .frame(width: .infinity, height: 50, alignment: .leading)
                        if showTable == true {
                                OnGoing()
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
                    UpComing(games: games,gamed: $gamed, bottomSheetShown: $bottomSheetShown)
                            
                    //Show all games that matches with preference
                }
            }
            if (bottomSheetShown != false) {
                GeometryReader{ geometry in
                    BottomSheetView(isOpen: self.$bottomSheetShown, maxHeight: 830)  {
                        VStack {
                            let id = gamed.id
                            let win1 = gamed.sites[0].odds.h2H[0]
                            let lose1  = -gamed.sites[0].odds.h2H[0]
                            let win2 = gamed.sites[0].odds.h2H[1]
                            let lose2 = -gamed.sites[0].odds.h2H[1]
                            let OddsAmount = [win1, lose2, win2, lose1]
                            let team_Name1 = gamed.teams[0]
                            let team_Name2 = gamed.teams[1]
                            BettingView(OddsAmount: OddsAmount, team_Name1: team_Name1, team_Name2: team_Name2, bottomSheetShown: $bottomSheetShown, id: id, buyingPower:buyingPower)
                        }
                        .padding(geometry.safeAreaInsets)
                        .transition(.move(edge: .leading))
                    }
                    .edgesIgnoringSafeArea(.all)
                }
            }
        }
        .onAppear{
            if session.pref?.NRL == true {
                OddsApi().getAURugbyOdds{
                    (games) in
                    if self.games.isEmpty {
                        self.games = games
                    }
                    else {
                        self.games += games
                    }
                }
            }
            if session.pref?.EPL == true {
                OddsApi().getUKSoccerOdds{
                    (games) in
                    if self.games.isEmpty {
                        self.games = games
                    }
                    else {
                        self.games += games
                    }
                }
            }
            if session.pref?.NBA == true {
                OddsApi().getUSBasketBallOdds{
                    (games) in
                    if self.games.isEmpty {
                        self.games = games
                    }
                    else {
                        self.games += games
                    }

                }
            }
            if session.pref?.Euroleague == true {
                OddsApi().getEUBasketBallOdds{
                    (games) in
                    if self.games.isEmpty {
                        self.games = games
                    }
                    else {
                        self.games += games
                    }
                }
            }
            if session.pref?.MLB == true {
                OddsApi().getUSBaseballOdds{
                    (games) in
                    if self.games.isEmpty {
                        self.games = games
                    }
                    else {
                        self.games += games
                    }
                }
            }
            if session.pref?.MLS == true {
                OddsApi().getUSSoccerOdds{
                    (games) in
                    if self.games.isEmpty {
                        self.games = games
                    }
                    else {
                        self.games += games
                    }
                }
            }
            if session.pref?.MMA == true {
                OddsApi().getMMAOdds{
                    (games) in
                    if self.games.isEmpty {
                        self.games = games
                    }
                    else {
                        self.games += games
                    }
                }
            }
            if session.pref?.NFL == true {
                OddsApi().getUSFootballOdds{
                    (games) in
                    if self.games.isEmpty {
                        self.games = games
                    }
                    else {
                        self.games += games
                    }
                }
            }
            if session.pref?.AFL == true {
                OddsApi().getAUFootballOdds{
                    (games) in
                    if self.games.isEmpty {
                        self.games = games
                    }
                    else {
                        self.games += games
                    }
                }
            }
            if session.pref?.NHL == true {
                OddsApi().getIceHockeyOdds{
                    (games) in
                    if self.games.isEmpty {
                        self.games = games
                    }
                    else {
                        self.games += games
                    }
                }
            }
        }
        
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
        NavigationView{
            VStack {
                List{
                    NavigationLink (destination: UpdatePasswordView())
                        { Text("Update Password").background(Color.clear)}
                    NavigationLink (destination: UpdatePreferenceView())
                        { Text("Update Sports Preference").background(Color.clear)}
//                    NavigationLink (destination: UpdateInformationView())
//                        { Text("Update User Information").background(Color.clear)}
                    NavigationLink (destination: ContactSupportView())
                        {Text("Contact Support")}
                    NavigationLink (destination: SportsBetting101View())
                        {Text("Sports Betting 101")}
                    NavigationLink (destination: DarkModeView())
                        {Text("Dark Mode")}
//                    NavigationLink (destination: NBAView()){Text("NBA")}
                    Button(action: session.signOut){
                        Text("Sign Out")
                            }
                }
                }
            .navigationBarTitle("Settings")
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .padding()
        }
    }
}

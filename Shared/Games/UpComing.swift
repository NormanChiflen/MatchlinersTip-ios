//
//  PostList.swift
//  UnderDog Prototype
//
//  Created by John Lee on 3/21/21.
//
import Foundation
import SwiftUI

struct UpComing: View {
    @State var games: [Datum] = []
    @EnvironmentObject var session: SessionStore
    @Binding var gamed : Datum
    @Binding var bottomSheetShown : Bool
    @State var sportsLabel : [String] = []
    @State var sportsTag = ["rugbyleague_nrl": "🏉",
                            "soccer_epl": "⚽",
                            "soccer_usa_mls": "⚽",
                            "basketball_euroleague": "🏀",
                            "basketball_nba": "🏀",
                            "americanfootball_ncaaf": "🏈",
                            "aussierules_afl": "🏈",
                            "baseball_mlb": "⚾",
                            "mma_mixed_martial_arts": "🥋",
                            "icehockey_nhl": "🏒"]
    
    
    
    
    
    var body: some View {
            VStack{
                ForEach(games) { game in
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            VStack{
                                Text("Teams \(sportsTag[game.sportKey]!)")
                                Divider()
                                Text(game.teams[0])
                                    .font(.system(size: 15))
                                Divider()
                                Text(game.teams[1])
                                    .font(.system(size: 15))
                                    Spacer()
                            }
                            Spacer()
                            VStack(spacing: 0){
                            HStack(alignment: .center, spacing: 20){
                                Text("Win")
                                Text("Lose")
                            }
                            HStack{
                                Spacer()
                            VStack{
                               Spacer()
                                Text("\(game.sites[0].odds.h2H[0], specifier: "%.2f")")
                                Divider()
                                Text("-\(game.sites[0].odds.h2H[0], specifier: "%.2f")")
                                Spacer()
                            }
                            VStack{
                                Spacer()
                                Text("-\(game.sites[0].odds.h2H[1], specifier: "%.2f")")
                                Divider()
                                Text("\(game.sites[0].odds.h2H[1], specifier: "%.2f")")
                                Spacer()
                            }
                                Spacer()
                            }
                            .background(Rectangle().fill(Color.green))
                            .cornerRadius(5)
                            .padding()
                            Spacer()
                            }
                            Spacer()
                        }
                        //End of HStack
                        .onTapGesture{
                            self.bottomSheetShown.toggle()
                            gamed = game
                        }
                        Spacer()
                    }       //End of VStack
                    .padding()
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
                if session.pref?.NCAAF == true {
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

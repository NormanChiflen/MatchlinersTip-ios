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
    @Binding var gamed : Datum
    @Binding var bottomSheetShown : Bool
    var body: some View {
            VStack{
                ForEach(games) { game in
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            VStack{
                                Text("Teams")
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
                OddsApi().getUKSoccerOdds{
                    (games) in
                    self.games = games
                }
            }
    }
}

//struct UpComing: View {
//    @State var games: [Datum] = []
////    @State var gamed : Datum
//    @Binding var gamed : Datum
//    @Binding var bottomSheetShown : Bool
//    var body: some View {
//            VStack{
//                ForEach(games) { game in
//                    VStack{
//                        Spacer()
//                        HStack{
//                            Spacer()
//                            VStack{
//                                Text("Teams")
//                                Divider()
//                                Text(game.teams[0])
//                                    .font(.system(size: 15))
//                                Divider()
//                                Text(game.teams[1])
//                                    .font(.system(size: 15))
//                            }
//                            .background(Color("Custom Color 1"))
//                            .cornerRadius(5)
//                            Spacer()
//                            VStack{
//                                Text("Win")
//                                Divider()
//                                Text("\(game.sites[0].odds.h2H[0], specifier: "%.2f")")
//                                Divider()
//                                Text("-\(game.sites[0].odds.h2H[0], specifier: "%.2f")")
//                            }
//                            .background(Color("Button Color"))
//                            .cornerRadius(5)
//                            Spacer()
//                            VStack{
//                                Text("Lost")
//                                Divider()
//                                Text("-\(game.sites[0].odds.h2H[1], specifier: "%.2f")")
//                                Divider()
//                                Text("\(game.sites[0].odds.h2H[1], specifier: "%.2f")")
//                            }
//                            .background(Color("Custom Color 2"))
//                            .cornerRadius(5)
//                            Spacer()
//                        }
//                        //End of HStack
//                        .onTapGesture{
//                            self.bottomSheetShown.toggle()
//                            gamed = game
//                        }
//                        Spacer()
//                    }       //End of VStack
//                    .padding()
//                }
//            }
//            .onAppear{
//                OddsApi().getUKSoccerOdds{
//                    (games) in
//                    self.games = games
//                }
//            }
//    }
//}

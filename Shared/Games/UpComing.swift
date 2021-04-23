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
    @State var bottomSheetShown = false
    var body: some View {
//        NavigationView{
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
                            }
                            .background(Color("Custom Color 1"))
                            .cornerRadius(5)
                            Spacer()
                            VStack{
                                Text("Win")
                                Divider()
                                Text("\(game.sites[0].odds.h2H[0], specifier: "%.2f")")
                                Divider()
                                Text("-\(game.sites[0].odds.h2H[0], specifier: "%.2f")")
                            }
                            .background(Color("Button Color"))
                            .cornerRadius(5)
                            Spacer()
                            VStack{
                                Text("Lost")
                                Divider()
                                Text("-\(game.sites[0].odds.h2H[1], specifier: "%.2f")")
                                Divider()
                                Text("\(game.sites[0].odds.h2H[1], specifier: "%.2f")")
                            }
                            .background(Color("Custom Color 2"))
                            .cornerRadius(5)
                            Spacer()
                        }
                        //End of HStack
                        .onTapGesture(perform: {
                            bottomSheetShown = true
                        })
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
//        }// end of navigationview
    }
}

struct UpComing_Previews: PreviewProvider {
    static var previews: some View {
        UpComing()
    }
}

////
////  PostList.swift
////  UnderDog Prototype
////
////  Created by John Lee on 3/21/21.
////
//
//import SwiftUI
//
//struct EPL: View {
//    @State var games: [Datum] = []
//    private var columns: [GridItem] = [
//        GridItem(.adaptive(minimum: 50)),
//        GridItem(.adaptive(minimum: 50)),
//        GridItem(.adaptive(minimum: 50)),
//        GridItem(.adaptive(minimum: 50))
//    ]
//    var body: some View {
//        List{
//            LazyVGrid(columns: columns,alignment: .center,spacing: 16){
//                ForEach(games) { game in
//                    Text(game.homeTeam)
//                }
//                .onAppear{
//                    OddsApi().getUKSoccerOdds{
//                        (games) in
//                        self.games = games
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct EPL_Previews: PreviewProvider {
//    static var previews: some View {
//        EPL()
//    }
//}

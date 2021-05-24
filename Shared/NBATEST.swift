////
////  NBATEST.swift
////  UnderDog Prototype
////
////  Created by John Lee on 5/22/21.
////
//
//import SwiftUI
//
//struct NBATEST: View {
//    @State var NBAeventStats: [Event] = []
//    var body: some View {
//        List(NBAeventStats){ NBAevent in
//            Text("\(NBAevent.id)")
//        }
//        .onAppear(){
//            ESPN().getNBAResults{ events in
//                NBAeventStats = events
//            }
//        }
//    }
//}
//
//struct NBATEST_Previews: PreviewProvider {
//    static var previews: some View {
//        NBATEST()
//    }
//}

////
////  ESPN.swift
////  UnderDog Prototype
////
////  Created by John Lee on 5/21/21.
////
//
//import Foundation
//
//class ESPN {
//    
//    
//    
//    func getNBAResults( completion: @escaping ([Event]) -> ()) {
//        
//        let urlString = "http://site.api.espn.com/apis/site/v2/sports/basketball/nba/scoreboard"
//        guard let url = URL(string: urlString) else {
//          print("Couldn't parse myURL = \(urlString)")
//          return
//        }
//        URLSession.shared.dataTask(with: url) { (data, res, error) in
//
//            let events = try! JSONDecoder().decode(Espnnba.self, from: data!)
//            print(events)
//            DispatchQueue.main.async {
//                print(events.events)
//                completion(events.events)
//            }
//        }
//        .resume()
//    }
//}

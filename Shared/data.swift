//
//  data.swift
//  UnderDog Prototype
//
//  Created by John Lee on 3/21/21.
//
import Foundation
import SwiftUI

// As of right now, OddsApi pull data from Odds Api and only displays the sports they have

class OddsApi {
//    @State private var API_KEY = "fdddc894261e9b8b7252cef12463faec"
    
    func getPosts(completion: @escaping ([Initial.Datas]) -> () ) {
        
        let urlString = "https://api.the-odds-api.com/v3/sports/?apiKey=fdddc894261e9b8b7252cef12463faec"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (info, _, _) in
            let posts = try! JSONDecoder().decode(Initial.self, from: info!)
            
            DispatchQueue.main.async {
//                print(posts.data)
                completion(posts.data)
            }
        }
        .resume()
    }
    func getUKSoccerOdds(completion: @escaping ([Datum]) -> () ) {
        
        guard let url = URL(string: "https://api.the-odds-api.com/v3/odds/?apiKey=fdddc894261e9b8b7252cef12463faec&sport=soccer_epl&region=uk&mkt=h2h") else { return }
//        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (info, _, _) in
            let games = try! JSONDecoder().decode(Welcome.self, from: info!)
            
            DispatchQueue.main.async {
//                print(games.data)
                completion(games.data)
            }
        }
        .resume()
    }
}

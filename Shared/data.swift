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
    func getPosts(completion: @escaping ([Initial.Datas]) -> () ) {
        guard let url = URL(string: "https://api.the-odds-api.com/v3/sports?apiKey=fdddc894261e9b8b7252cef12463faec") else { return }
        URLSession.shared.dataTask(with: url) { (info, _, _) in
            let posts = try! JSONDecoder().decode(Initial.self, from: info!)
            
            DispatchQueue.main.async {
//                print(posts.data)
                completion(posts.data)
            }
        }
        .resume()
    }
}

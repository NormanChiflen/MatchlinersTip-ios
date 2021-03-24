//
//  data.swift
//  UnderDog Prototype
//
//  Created by John Lee on 3/21/21.
//
import Foundation
import SwiftUI

struct Initial: Codable {
    let success: Bool
    let data: [Datas]
    struct Datas: Codable {
        let key: String
        let active: Bool
        let group: String
        let details: String
        let title: String
        let has_outrights: Bool
    }
}



class OddsApi {
    func getPosts() {
        guard let url = URL(string: "https://api.the-odds-api.com/v3/sports?apiKey=fdddc894261e9b8b7252cef12463faec") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode(Initial.self, from: data!)
            print(posts.data)
        }
        .resume()
    }
}

//
//  GameResult.swift
//  UnderDog Prototype
//
//  Created by John Lee on 7/20/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct GameResult: Codable {
    var away_score: String = ""
    var away_team: String = ""
    var date: String = ""
    var full_name: String = ""
    var home_score: String = ""
    var home_team: String = ""
    var period: Int = 0
    var short_name: String = ""
    var status: String = ""
    var winner: String = ""
}

class ResultRepository: ObservableObject {
    private var db = Firestore.firestore()
    
    func findFinishedGames(completion: @escaping (_ result: [GameResult],_ error: Error?) -> Void) {
            var evaluateGames: [GameResult] = []
            var temp = GameResult(away_score: "", away_team: "", date: "", full_name: "", home_score: "", home_team: "", period: 0, short_name: "", status: "", winner: "")
            let finishedGames = try db.collection("NBA").whereField("status", isEqualTo: "Final").getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            let result = try? document.data(as: GameResult.self)
                            evaluateGames.append(result ?? temp)
                        }
                    }
            completion(evaluateGames, nil)
        }
    }
}

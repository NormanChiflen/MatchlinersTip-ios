//
//  GameResult.swift
//  UnderDog Prototype
//
//  Created by John Lee on 7/20/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct NBAGameResult: Codable {
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

struct MLBGameResult: Codable {
    var away_score: String = ""
    var away_team: String = ""
    var date: String = ""
    var full_name: String = ""
    var home_score: String = ""
    var home_team: String = ""
    var innings: Int = 0
    var short_name: String = ""
    var status: String = ""
    var winner: String = ""
    var id: String = ""
}

class ResultRepository: ObservableObject {
    private var db = Firestore.firestore()
    
    func findFinishedGames(completion: @escaping (_ result: [MLBGameResult],_ error: Error?) -> Void) {
            var evaluateGames: [MLBGameResult] = []
//            db.collection("MLB").whereField("status", isEqualTo: "Final").getDocuments() { (querySnapshot, err) in
//                    if let err = err {
//                        print("Error getting documents: \(err)")
//                    } else {
//                        for document in querySnapshot!.documents {
//                            let result = try? document.data(as: MLBGameResult.self)
//                            if result != nil{
//                                evaluateGames.append(result!)
//                            }
//                        }
//                    }
//                completion(evaluateGames, nil)
//            }
            db.collection("MLB_new").whereField("status", isEqualTo: "Final").addSnapshotListener { querySnapshot, error in
                guard querySnapshot != nil else{
                    print("Error fetching mlbGames: \(error)")
                    return
                }
                for document in querySnapshot!.documents {
                    let result = try? document.data(as: MLBGameResult.self)
                    if result != nil {
                        evaluateGames.append(result!)
                    }
                }
                completion(evaluateGames, nil)
            }
    }
}

//
//  UserProfile.swift
//  UnderDog Prototype
//
//  Created by John Lee on 4/3/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct UserProfile: Codable {
  var uid: String
  var displayName: String
  var State: String
  var age: Int
  var email: String
  var score: [Double]
}

struct preference: Codable {
  var NFL: Bool
  var AFL: Bool
  var MLB: Bool
  var NBA: Bool
  var NHL: Bool
  var Euroleague: Bool
  var MMA: Bool
  var NRL: Bool
  var EPL: Bool
  var MLS: Bool
}

class UserProfileRepository: ObservableObject {
  private var db = Firestore.firestore()

    func createProfile(profile: UserProfile, preference: preference, completion: @escaping (_ profile: UserProfile?, _ preference: preference? ,_ error: Error?) -> Void) {
    do {
        let _ = try db.collection("users").document(profile.uid).setData(from: profile)
        let _ = try db.collection("users").document(profile.uid).collection("preference").document("preference").setData(from: preference)
        completion(profile, preference, nil)
    }
    catch let error {
      print("Error writing users to Firestore: \(error)")
      completion(nil, nil, error)
    }
  }

    func fetchProfile(userId: String, completion: @escaping (_ profile: UserProfile?, _ error: Error?) -> Void) {
        db.collection("users").document(userId).getDocument { (snapshot, error) in
          let profile = try? snapshot?.data(as: UserProfile.self)
          completion(profile, error)
        }
    }
    func fetchPref(userId: String, completion: @escaping (_ pref: preference?, _ error: Error?) -> Void) {
        db.collection("users").document(userId).collection("preference").document("preference").getDocument { (snapshot, error) in
            let pref = try? snapshot?.data(as: preference.self)
            completion(pref,error)
        }
    }
    func updatePref(userId: String, NFL:Bool, AFL: Bool, MLB: Bool, NBA: Bool, NHL: Bool, Euroleague: Bool, MMA: Bool, NRL: Bool, EPL: Bool, MLS: Bool, completion: @escaping (_ pref: preference?, _ error: Error?) -> Void) {
        db.collection("users").document(userId).collection("preference").document("preference").updateData([
            "NFL": NFL,
            "AFL": AFL,
            "MLB": MLB,
            "NHL": NHL,
            "NBA": NBA,
            "Eueroleague": Euroleague,
            "MMA": MMA,
            "NRL": NRL,
            "EPL": EPL,
            "MLS": MLS
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
}

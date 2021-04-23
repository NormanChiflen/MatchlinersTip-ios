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
}
struct HelpTicket: Codable{
    var email: String
    var issue: String
}

class HelpTicketRepository: ObservableObject{
    private var db = Firestore.firestore()
    
    func createHelpTicket(profile: HelpTicket, completion: @escaping (_ profile: HelpTicket?, _ error: Error?)-> Void){
        do {
            let _ = try db.collection("HelpTicket").document(profile.email).setData(from: profile)
            completion(profile, nil)
        }
        catch let error {
          print("Error writing users to Firestore: \(error)")
          completion(nil, error)
        }
    }
}

class UserProfileRepository: ObservableObject {
  private var db = Firestore.firestore()

  func createProfile(profile: UserProfile, completion: @escaping (_ profile: UserProfile?, _ error: Error?) -> Void) {
    do {
        let _ = try db.collection("users").document(profile.uid).setData(from: profile)

        completion(profile, nil)
    }
    catch let error {
      print("Error writing users to Firestore: \(error)")
      completion(nil, error)
    }
  }

  func fetchProfile(userId: String, completion: @escaping (_ profile: UserProfile?, _ error: Error?) -> Void) {
    db.collection("users").document(userId).getDocument { (snapshot, error) in
      let profile = try? snapshot?.data(as: UserProfile.self)
      completion(profile, error)
    }
  }
}

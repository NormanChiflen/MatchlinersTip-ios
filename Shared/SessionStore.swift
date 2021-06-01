//
//  SessionStore.swift
//  UnderDog Prototype
//
//  Created by John Lee on 3/11/21.
//

import SwiftUI
import Firebase
import Combine
import Foundation

class SessionStore: ObservableObject {
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? {didSet {self.didChange.send(self) }}
    @Published var profile: UserProfile?
    @Published var pref: preference?
    @Published var order: OrderDetails?
    @Published var isDarkMode = false
    @Published var onGoingBets: [OrderDetails] = []
    private var profileRepository = UserProfileRepository()
    private var orderRespository = OrderRepository()
    
    var handle: AuthStateDidChangeListenerHandle?
    func listen() {
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let user = user {
                print("User displayName: \(String(describing: user.displayName))")
                self.session = User(uid: user.uid, email: user.email, displayName: user.displayName)
                
                self.profileRepository.fetchProfile(userId: user.uid) { (profile, error) in
                  if let error = error {
                    print("Error while fetching the user profile: \(error)")
                    return
                  }

                  self.profile = profile
                }
                self.profileRepository.fetchPref(userId: user.uid) { (pref, error) in
                  if let error = error {
                    print("Error while fetching the user profile: \(error)")
                    return
                  }

                  self.pref = pref
                }
                self.orderRespository.fetchOrder(userId: user.uid) { (onGoingBets, error) in
                  if let error = error {
                    print("Error while fetching the user profile: \(error)")
                    return
                  }

                    self.onGoingBets = onGoingBets!
                }
                //Call the checker function here
                
            } else {
                self.session = nil
            }
        })
    }
    func signUp(email: String, password: String, displayName: String ,State: String, age: Int, score: [Double], NFL: Bool, AFL: Bool, MLB: Bool, NBA: Bool, NHL: Bool, Euroleague: Bool, MMA: Bool, NRL: Bool, EPL: Bool, MLS: Bool, completion: @escaping (_ profile: UserProfile?,_ pref: preference? ,_ error: Error?) -> Void) {
      Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
        if let error = error {
          print("Error signing up: \(error)")
          completion(nil, nil, error)
          return
        }
        guard let user = result?.user else { return }
        print("User \(user.uid) signed up.")

        let userProfile = UserProfile(uid: user.uid, displayName: displayName, State: State, age: age, email: email, score: score)
        let pref = preference(NFL: NFL, AFL: AFL, MLB: MLB, NBA: NBA, NHL: NHL, Euroleague: Euroleague, MMA: MMA, NRL: NRL, EPL: EPL, MLS: MLS)
        self.profileRepository.createProfile(profile: userProfile, preference: pref) { (profile, preference, error) in
          if let error = error {
            print("Error while creating the user profile: \(error)")
            completion(nil, nil, error)
            return
          }
          self.profile = profile
          self.pref = pref
          completion(profile, preference, nil)
        }
      }
    }
    func signIn(email: String, password: String, completion: @escaping (_ profile: UserProfile?, _ pref: preference?, _ error: Error?) -> Void) {
      Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
        if let error = error {
          print("Error signing in: \(error)")
          completion(nil, nil, error)
          return
        }

        guard let user = result?.user else { return }
        print("User \(user.uid) signed in.")

        self.profileRepository.fetchProfile(userId: user.uid) { (profile, error) in
          if let error = error {
            print("Error while fetching the user profile: \(error)")
            completion(nil, nil, error)
            return
          }

          self.profile = profile
          completion(profile, nil, nil)
        }
        self.profileRepository.fetchPref(userId: user.uid) { (pref, error) in
            if let error = error {
                print("Error while fetching user preference: \(error)")
                completion(nil, nil, error)
                return
            }
            self.pref = pref
            completion(self.profile, pref, nil)
        }
//        self.orderRespository.fetchOrder(userId: user.uid) { (onGoingBets, error) in
//            if let error = error {
//                print("Error while fetching user orders: \(error)")
//                completion(nil, nil, error)
//                return
//            }
//            self.onGoingBets = onGoingBets ?? []
//        }
      }
    }

    func signOut() {
      do {
        try Auth.auth().signOut()
        self.session = nil
        self.profile = nil
        self.pref = nil
        self.onGoingBets = []
      }
      catch let signOutError as NSError {
        print("Error signing out: \(signOutError)")
      }
    }
    func changePassword(email: String, currentPassword: String, newPassword: String, completion: @escaping (Error?) -> Void){
            let credential = EmailAuthProvider.credential(withEmail: email, password: currentPassword)
            Auth.auth().currentUser?.reauthenticate(with: credential, completion:{(result, error) in
                if let error = error {completion(error)}
                else {
                    Auth.auth().currentUser?.updatePassword(to: newPassword, completion: {(error) in completion(error)})
                }
            } )
        }
    
    func confirmUpdatedPref(NFL: Bool, AFL: Bool, MLB: Bool, NBA: Bool, NHL: Bool, Euroleague: Bool, MMA: Bool, NRL: Bool, EPL: Bool, MLS: Bool,completion: @escaping (_ pref: preference?, _ error: Error?) -> Void) {
        let user = Auth.auth().currentUser
        if let user = user {
            let uid = user.uid
            self.profileRepository.updatePref(userId:uid, NFL:NFL, AFL: AFL, MLB: MLB, NBA: NBA, NHL: NHL, Euroleague: Euroleague, MMA: MMA, NRL: NRL, EPL: EPL, MLS: MLS){ (pref, error) in
                if let error = error {
                    print("Error whil confirm updating user preference: \(error)")
                    completion(nil, nil)
                    return
                }
                self.pref = pref
            }
        }
    }
    func resetPassword(email: String){
        Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func submitOrder(id: String, userId: String,time: String, team_Name1: String, team_Name2: String, SelectedOdd: Double, ExpectedEarning: Double, value: String, purchase: String, completion: @escaping (_ order: OrderDetails?, _ error: Error?) -> Void){
        let orderDetail = OrderDetails(id: id, time: time, team_Name1: team_Name1, team_Name2: team_Name2, SelectedOdd: SelectedOdd, ExpectedEarning: ExpectedEarning, value: value, purchase: purchase)
        self.orderRespository.createOrder(userId: userId, order: orderDetail){
            (order, error) in
              if let error = error {
                print("Error while submitting betting order: \(error)")
                completion(nil, error)
                return
              }
              self.order = order
              completion(order, nil)
        }
    }
    
    func unbind(){
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    deinit {
        unbind()
    }
}

struct User {
    var uid: String
    var email: String? //? = optional
    var displayName: String?
    init(uid: String, email: String?, displayName: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}

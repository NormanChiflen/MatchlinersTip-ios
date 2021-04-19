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
    private var profileRepository = UserProfileRepository()
    
    var handle: AuthStateDidChangeListenerHandle?
    func listen() {
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let user = user {
                print("User displayName: \(String(describing: user.displayName))")
                self.session = User(uid: user.uid, email: user.email, displayName: user.displayName)
            } else {
                self.session = nil
            }
        })
    }
    func signUp(email: String, password: String, displayName: String ,State: String, age: Int, completion: @escaping (_ profile: UserProfile?, _ error: Error?) -> Void) {
      Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
        if let error = error {
          print("Error signing up: \(error)")
          completion(nil, error)
          return
        }

        guard let user = result?.user else { return }
        print("User \(user.uid) signed up.")

        let userProfile = UserProfile(uid: user.uid, displayName: displayName, State: State, age: age, email: email)
        self.profileRepository.createProfile(profile: userProfile) { (profile, error) in
          if let error = error {
            print("Error while fetching the user profile: \(error)")
            completion(nil, error)
            return
          }
          self.profile = profile
          completion(profile, nil)
        }
      }
    }
    func signIn(email: String, password: String, completion: @escaping (_ profile: UserProfile?, _ error: Error?) -> Void) {
      Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
        if let error = error {
          print("Error signing in: \(error)")
          completion(nil, error)
          return
        }

        guard let user = result?.user else { return }
        print("User \(user.uid) signed in.")

        self.profileRepository.fetchProfile(userId: user.uid) { (profile, error) in
          if let error = error {
            print("Error while fetching the user profile: \(error)")
            completion(nil, error)
            return
          }

          self.profile = profile
          completion(profile, nil)
        }
      }
    }

    func signOut() {
      do {
        try Auth.auth().signOut()
        self.session = nil
        self.profile = nil
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
    func resetPassword(email: String){
        Auth.auth().sendPasswordReset(withEmail: email)
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

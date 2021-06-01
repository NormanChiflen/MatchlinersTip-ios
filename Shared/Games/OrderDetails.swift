//
//  OrderDetails.swift
//  UnderDog Prototype
//
//  Created by John Lee on 5/17/21.

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct OrderDetails: Codable, Identifiable {
  var id: String = ""
  var time: String = ""
  var team_Name1: String = ""
  var team_Name2: String = ""
  var SelectedOdd: Double = 0
  var ExpectedEarning: Double = 0
  var value: String = ""
  var purchase: String = ""
}

class OrderRepository: ObservableObject {
  private var db = Firestore.firestore()
    func createOrder(userId: String,order: OrderDetails, completion: @escaping (_ order: OrderDetails?,_ error: Error?) -> Void) {
    do {
        let _ = try db.collection("users").document(userId).collection("On Going Bet").document(order.time).setData(from: order)
        completion(order, nil)
    }
    catch let error {
      print("Error writing users to Firestore: \(error)")
      completion(nil, error)
    }
  }

    func fetchOrder(userId: String, completion: @escaping ( _ OnGoingBets: [OrderDetails]?, _ error: Error?) -> Void) {
        db.collection("users").document(userId).collection("On Going Bet").getDocuments() { (querySnapshot, err) in
        var OnGoingBets: [OrderDetails] = []
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {
                let order = try? document.data(as: OrderDetails.self)
                OnGoingBets.append(order!)
            }
        }
          completion(OnGoingBets, err)
        }

    }
    //Delete ongoing bet if game has ended and add to order history win/lost
}

//
//  OrderDetails.swift
//  UnderDog Prototype
//
//  Created by John Lee on 5/17/21.

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct OrderDetails: Codable {
  var time: String = ""
  var team_Name1: String = ""
  var team_Name2: String = ""
    var SelectedOdd: Double = 0
  var ExpectedEarning: Double = 0
  var value: String = ""
}

class OrderRepository: ObservableObject {
  private var db = Firestore.firestore()

    func createOrder(userId: String,order: OrderDetails, completion: @escaping (_ order: OrderDetails?,_ error: Error?) -> Void) {
    do {
        let _ = try db.collection("users").document(userId).collection("Order History").document(order.time).setData(from: order)
        completion(order, nil)
    }
    catch let error {
      print("Error writing users to Firestore: \(error)")
      completion(nil, error)
    }
  }

    func fetchOrder(userId: String, order: OrderDetails, completion: @escaping (_ order: OrderDetails?, _ error: Error?) -> Void) {
        db.collection("users").document(userId).collection("Order History").document(order.time).getDocument { (snapshot, error) in
          let order = try? snapshot?.data(as: OrderDetails.self)
          completion(order, error)
        }
    }
}

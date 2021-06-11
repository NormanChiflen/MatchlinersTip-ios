//
//  apiBaseball.swift
//  UnderDog Prototype
//
//  Created by John Lee on 6/7/21.
//

import Foundation
//import Alamofire

class apiBaseball {
//    @State private var API_KEY = "fdddc894261e9b8b7252cef12463faec"
//    let MAIN_URL = "https://api-baseball.p.rapidapi.com/odds?league=1&season=2021"
//
//        let headers: HTTPHeaders = [
//            "X-RapidAPI-Host": "api-baseball.p.rapidapi.com",
//            "X-RapidAPI-Key": "1dda1367c8msh5ddb3ecac2ebc79p1851d7jsn59ecfb40c3a3"
//        ]
//
//    func getLeague() {
//
//        let url = MAIN_URL
//
//        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseJSON{ response in
//              if let JSON = response.value {
//                  if response.response?.statusCode == 200{
////                      completionHandler(JSON as AnyObject?, nil)
//                    print(JSON)
//                  }else if(response.response?.statusCode == 401){
////                        completionHandler(JSON as AnyObject?, nil)
//                    print(JSON)
//                  }
//              }
//              else{
//                  if response.response?.statusCode == 401 {
//                      print("Request timed out.")
//                  }
//                  else {
//                    print(response.error)
//                  }
//              }
//         }
//    }
//    func jsonToString(json: AnyObject){
//            do {
//                let data1 =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
//                let convertedString = String(data: data1, encoding: String.Encoding.utf8) // the data will be converted to the string
//                print(convertedString) // <-- here is ur string
//
//            } catch let myJSONError {
//                print(myJSONError)
//            }
//
//        }
    func getGames() {
        let headers = [
            "x-rapidapi-key": "1dda1367c8msh5ddb3ecac2ebc79p1851d7jsn59ecfb40c3a3",
            "x-rapidapi-host": "api-baseball.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api-baseball.p.rapidapi.com/odds?league=1")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
            guard let jsonData = data else{
                print("URLSession dataTask error:", error ?? "nil")
                return
            }
            let decoder = JSONDecoder()
            do {
                let gameResponse = try decoder.decode(BaseballOdds.self, from:jsonData)
                print(gameResponse)
//                guard let json = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String:Any] else { return }
//                let data1 =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
//                let convertedString = String(data: data1, encoding: String.Encoding.utf8) // the data will be converted to the string
//                print(convertedString) // <-- here is ur string
//                for item in json {
//                    print(item)
//                }
//                print(json)
            } catch{
                print("Error in JSON parsing")
            }
        })

        dataTask.resume()
    }
}

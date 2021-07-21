//
//  apiBaseball.swift
//  UnderDog Prototype
//
//  Created by John Lee on 6/7/21.
//

import Foundation
//import Alamofire

class apiBaseball {
    func getOdds(completion: @escaping ([Response]) -> () ) {
        let headers = [
            "x-rapidapi-key": "1dda1367c8msh5ddb3ecac2ebc79p1851d7jsn59ecfb40c3a3",
            "x-rapidapi-host": "api-baseball.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api-baseball.p.rapidapi.com/odds?season=2021&league=1")! as URL,
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
//                print(httpResponse ?? "")
            }
            guard let jsonData = data else{
                print("URLSession dataTask error:", error ?? "nil")
                return
            }
            enum DateError: String, Error {
                case invalidDate
            }
            let decoder = JSONDecoder()
            
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)

            decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
                let container = try decoder.singleValueContainer()
                let dateStr = try container.decode(String.self)

                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
                if let date = formatter.date(from: dateStr) {
                    return date
                }
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
                if let date = formatter.date(from: dateStr) {
                    return date
                }
                throw DateError.invalidDate
            })
            do {
//                let json = try JSONSerialization.jsonObject(with: jsonData, options: [])
//               let Jdata = Data(json.utf8)
//                print(json)
                let baseballOdds = try decoder.decode(BaseballOdds.self, from: jsonData)
                print(baseballOdds)
                DispatchQueue.main.async {
    //                print(games.data)
                    completion(baseballOdds.response)
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        })
        dataTask.resume()
    }
}

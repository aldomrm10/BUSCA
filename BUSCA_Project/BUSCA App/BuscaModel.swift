//
//  BuscaModel.swift
//  BUSCA App
//
//  Created by Aldo Mario Rogliero on 2/25/20.
//  Copyright © 2020 Georgia Institute of Technology. All rights reserved.
//

import Foundation

class BuscaModel {
    static var database : NSDictionary = [:]
    static var urlString = "https://fvqmb46jr5.execute-api.us-east-1.amazonaws.com/test/helloworld"
    
    static func main() {
        // check status every 10 minutes and update database accordingly
        checkStatus()
        Timer.scheduledTimer(withTimeInterval: 60.0, repeats: true) { timer in
            checkStatus()
        }
    }
    
    static func checkStatus() {
        let session = URLSession.shared
       
        let url = URL(string: urlString)!
    
        let task = session.dataTask(with: url) { data, response, error in

            if error != nil || data == nil {
                print("Client error!")
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }

            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }

            do {
                
                var str = "Data is nil"
                if (data != nil) {
                    str = String(decoding: data!, as: UTF8.self)
                }
                print(str)
                
                let json : NSDictionary = try JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                
                // put data in database
                BuscaModel.database = json
                
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
}

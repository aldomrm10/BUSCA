//
//  Culc2ndFloor.swift
//  BUSCA App
//
//  Created by Aldo Mario Rogliero on 2/24/20.
//  Copyright © 2020 Georgia Institute of Technology. All rights reserved.
//


import UIKit

class Culc2ndFloor : UIViewController, FloorViewController {
    
    @IBOutlet var tables : [UILabel]!
    
    var urlString : String = "https://fvqmb46jr5.execute-api.us-east-1.amazonaws.com/test/helloworld"
    
    override func viewDidLoad() {
        updateLabels()
        super.viewDidLoad()
    }
    
    func updateLabels() {
        for table in tables {
            let status = getStatus(id: table.restorationIdentifier)
            if (status == nil) {
                table.text="⬛️"
            } else if (status == true) {
                table.text="🟩"
            } else {
                table.text="🟥"
            }
        }
    
    }
    
    func getStatus(id:String?) -> Bool? {
        var isAvailable : Bool?
        if (id != nil) {
            // code for checking availability status
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
                    isAvailable = json.object(forKey: id!) as? Bool
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                }
            }

            task.resume()
        }
        return isAvailable
    }
}

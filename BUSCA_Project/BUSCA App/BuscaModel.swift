//
//  BuscaModel.swift
//  BUSCA App
//
//  Created by Aldo Mario Rogliero on 2/25/20.
//  Copyright © 2020 Georgia Institute of Technology. All rights reserved.
//

import Foundation

struct Device  {
    var id : String? = nil
    var building : String? = nil
    var floor : Int? = nil
    var status : Bool? = nil
    init(json : NSDictionary?) {
        if (json != nil) {
            self.id = json!["DeviceID"] as? String
            self.building = json!["Building"] as? String
            self.floor = Int(json!["Floor"] as? String ?? "0")
            let st = json!["Status"] as? String
            if (st == "true") {
                self.status = true
            } else if (st == "false") {
                self.status = false
            } else {
                print ("STATUS IS NIL FOR ID \(String(describing: self.id))")
                self.status = nil
            }
        } else {
            print("json is nil")
        }
    }

}
                        // id
typealias Devices =     [String : Device]
                        // floor
typealias Floors =      [Int : Devices]
                        // building
typealias Buildings =   [String : Floors]

class BuscaModel {
                        // Building
    static var database : Buildings = [:]
    static var urlString = "https://pttfdf7me9.execute-api.us-east-1.amazonaws.com/prod/busca"
    
    static func main() {
        // check status every 10 minutes and update database accordingly
        checkStatus()
        var date : Date
        var calendar : Calendar
        var min : Int
        while (true) {
            date = Date()
            calendar = Calendar.current
            min = calendar.component(.minute, from: date)
            min %= 10
            print("Min: \(min)")
            sleep(UInt32(600 - min * 60 + 30))  // devices will push status
                                                // every 10 minutes to database
                                                // (at every XX:X0 minute mark)
                                                // so a 30 second buffer is there
                                                // to give the devices and database
                                                // time to update
                                                // TODO: refresh faster for demo
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
                print("received: \(str)")
                
                let json : NSDictionary = try JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                let statusCode = json.object(forKey: "statusCode")
                if (statusCode != nil) {
                    if (statusCode as! Int == 200) {
                        // put data in database
                        let list = json["body"] as? [NSDictionary]
                        if (list != nil) {
                            for item in list! {
                                print(item)
                                let dev = Device(json: item)
                                
                                let buildingName = dev.building // String
                                let floorNum = dev.floor           // Int
                                if (buildingName == nil) {
                                    print("Building is nil")
                                    break
                                } else if (floorNum == nil) {
                                    print("Floor is nil")
                                    break
                                }
                                let building = database[buildingName!]
                                if (building == nil) {  // building not created yet
                                    let device = [dev.id! : dev]
                                    let floor = [dev.floor! : device]
                                    database[buildingName!] = floor
                                } else {                // building already exists, check if floor exists
                                    let floor = building![floorNum!]
                                    if (floor == nil) { // floor not created yet
                                        let device = [dev.id! : dev]
                                        database[buildingName!]![floorNum!] = device
                                    } else {            // floor already created, just add/overwrite device
                                        database[buildingName!]![floorNum!]![dev.id!] = dev
                                    }
                                }
                            }
                        }
                        
                    } else {
                        print("received statusCode: \(statusCode!)")
                    }
                } else {
                    print("statusCode is nil")
                }
                printDataBase()
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    static func printDataBase() {
        print("database:")
        print(BuscaModel.database)
    }
    
}

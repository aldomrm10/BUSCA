//
//  Culc3rdFloor.swift
//  BUSCA App
//
//  Created by Aldo Mario Rogliero on 2/24/20.
//  Copyright © 2020 Georgia Institute of Technology. All rights reserved.
//


import UIKit

class Culc3rdFloor : UIViewController, FloorViewController {
    
    @IBOutlet var tables : [UILabel]!
    
    var urlString : String = "https://fvqmb46jr5.execute-api.us-east-1.amazonaws.com/test/helloworld"
    
    override func viewDidLoad() {
        updateLabels()
        super.viewDidLoad()
    }
    
    func updateLabels() {
        var status : Bool?
        var floor : NSDictionary?
        var building : String?
        for table in tables {
            status = nil
            print("id: '\(table.restorationIdentifier ?? "none")'")
            if (table.restorationIdentifier != nil) {
                building = (BuscaModel.database["Building"] as? String?) ?? nil
                if (building != "CULC") {
                    print("Building: \(building ?? "nil")")
                    floor = BuscaModel.database.object(forKey: "Floor3") as! NSDictionary?
                    if (floor != nil) {
                        status = floor!.object(forKey: table.restorationIdentifier!) as! Bool?
                        print(status ?? "status is nil")
                    } else {
                        print("floor is nil")
                    }
                }
            }
            if (status == nil) {
                table.text="⬛️"
            } else if (status! == true) {
                table.text="🟩"
            } else {
                table.text="🟥"
            }
        }
    }
    
}

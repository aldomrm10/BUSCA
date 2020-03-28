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
//        BuscaModel.checkStatus()
        updateLabels()
        super.viewDidLoad()
    }
    
  func updateLabels() {
       var status : Bool?
       var floor : Devices?
       var building : Floors?
       for table in tables {
           status = nil
           print("id: '\(table.restorationIdentifier ?? "none")'")
           if (table.restorationIdentifier != nil) {
               building = BuscaModel.database["CULC"]
               if (building == nil) {
                   print("Building is nil")
               } else {
                   floor = building![3]
                   if (floor != nil) {
                       if (table.restorationIdentifier != nil) {
                           let device = floor![table.restorationIdentifier!]
                           if (device != nil) {
                               if (device!.status != nil) {
                                   print("id: \(table.restorationIdentifier!)) status: \(device!.status!)")
                                   status = device!.status
                               }
                           }
                       }
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

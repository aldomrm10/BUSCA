//
//  ViewController.swift
//  BUSCA App
//
//  Created by Aldo Mario Rogliero on 2/5/20.
//  Copyright © 2020 Georgia Institute of Technology. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isAvailable = true
    override func viewDidLoad() {
        updateLabels()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet var culc3: [UILabel]!
    
    func getStatus(id: String?) -> Bool {
        if (id == nil) {
            return false
        } else {
            return true
        }
    }
    
    
    func updateLabels() {
        for table in culc3 {
            if (getStatus(id: table.restorationIdentifier)) {
                table.text="🟩"
            } else {
                table.text="🟥"
            }
        }
    
    }
    

}

//
//  FloorViewController.swift
//  BUSCA App
//
//  Created by Aldo Mario Rogliero on 2/25/20.
//  Copyright © 2020 Georgia Institute of Technology. All rights reserved.
//

import Foundation
import UIKit

protocol FloorViewController : UIViewController {
    
    var tables : [UILabel]! { get }
    var urlString : String { get }
    
    func updateLabels() -> Void
    
}

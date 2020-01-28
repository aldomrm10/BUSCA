//
//  ViewController.swift
//  DrawerMenuExample
//
//  Created by Florian Marcu on 1/17/18.
//  Copyright © 2018 iOS App Templates. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let mainVC = UIViewController()
    mainVC.view.backgroundColor = #colorLiteral(red: 1, green: 0.9025613755, blue: 0.4711082434, alpha: 1)
    
    let rootController = RootViewController(mainViewController: mainVC, topNavigationLeftImage: UIImage(named: "hamburger-menu-icon"))
    
    let menuVC = MenuViewController()
    menuVC.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    let drawerVC = DrawerController(rootViewController: rootController, menuController: menuVC)
    self.addChild(drawerVC)
    view.addSubview(drawerVC.view)
    drawerVC.didMove(toParent: self)
  }
}

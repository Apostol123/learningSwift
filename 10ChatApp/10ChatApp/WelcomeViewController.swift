//
//  ViewController.swift
//  10ChatApp
//
//  Created by user159106 on 1/14/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Auth.auth().currentUser != nil {
                        self.performSegue(withIdentifier: "fromWelcomeToChat", sender: self)
        }
        
    }


}


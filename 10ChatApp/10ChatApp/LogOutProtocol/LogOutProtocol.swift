//
//  LogOutProtocol.swift
//  10ChatApp
//
//  Created by user159106 on 1/29/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import Foundation
import UIKit
import Firebase

protocol LogOutProtocol {
    func logOut()
}

extension LogOutProtocol where Self : UIViewController {
    func logOut() {
        do {
                 try Auth.auth().signOut()
                 
             } catch  {
                 print("No se ha podido hacer el logut")
             }
             navigationController?.popToRootViewController(animated: true)
    }
}

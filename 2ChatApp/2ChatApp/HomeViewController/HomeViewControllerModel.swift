//
//  HomeViewControllerModel.swift
//  2ChatApp
//
//  Created by user159106 on 2/2/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import Foundation
import Firebase

public class HomeViewControllerModel {
    
    public weak var view: HomeViewControllerProtocol?
    
    public init() {
        
    }
}

extension HomeViewControllerModel: HomeViewControllerProtocol {
    public func isUserLogged() -> Bool {
        if Auth.auth().currentUser != nil {
            return true
        } else {
            return false
        }
    }
    
    
}

//
//  DataManager.swift
//  DatnaManagement
//
//  Created by user159106 on 12/2/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import Foundation

class DataManager {
    var serviceProxy = DMServiceProxy()
    
    
}

extension DataManager : DataMangerProtocol {
    func getAllUsers(completion: @escaping (Result<User>) -> Void) {
        serviceProxy.getAllUSers { users in
            completion(.succes(User(model: users)))
        }
    }
    
    
}

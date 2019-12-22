//
//  DataManagerProtocol.swift
//  DatnaManagement
//
//  Created by user159106 on 12/2/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import Foundation


protocol DataMangerProtocol : AnyObject {
    func getAllUsers(completion: @escaping (Result<User>) -> Void)
}

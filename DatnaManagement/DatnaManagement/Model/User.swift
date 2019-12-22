//
//  User.swift
//  DatnaManagement
//
//  Created by user159106 on 12/1/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import Foundation

public struct User {
   public let id : String
   public let name : String
}

extension User {
    init(with model: UserOC) {
        self.id = model.userId
        self.name = model.name
    }
}


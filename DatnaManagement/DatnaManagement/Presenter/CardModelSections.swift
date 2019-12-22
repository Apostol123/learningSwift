//
//  CardModelSections.swift
//  DatnaManagement
//
//  Created by user159106 on 12/10/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import Foundation

extension User {
    func getUserData() -> [CardPresenterSections] {
       
        return [.userData(name: name)]
    }
}

//
//  Result.swift
//  DatnaManagement
//
//  Created by user159106 on 12/1/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import Foundation

public enum Result <T> {
    case succes(T)
    case failure(Error)
}

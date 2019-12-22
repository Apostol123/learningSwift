//
//  CardPresenterSections.swift
//  DatnaManagement
//
//  Created by user159106 on 12/10/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import Foundation

public enum CardPresenterSections {
    case userData(name: String)
}

public protocol CardPresenterProtocol : AnyObject {
    func initialState()
}

public struct CardPresenterViewModel {
    let sections : [CardPresenterSections]
}

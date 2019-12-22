//
//  ViewControllerProtocl.swift
//  DatnaManagement
//
//  Created by user159106 on 12/17/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import Foundation

public protocol ViewControllerProtocol : AnyObject {
    func refresh(_ mode: CardPresenterViewModel) 
}

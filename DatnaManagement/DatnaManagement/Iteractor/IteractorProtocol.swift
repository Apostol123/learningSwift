//
//  IteractorProtocol.swift
//  DatnaManagement
//
//  Created by user159106 on 12/4/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import Foundation

protocol InteractorProtocol {
    func getAllMesseges(withCompletion: @escaping(Result<User>) -> Void)
}

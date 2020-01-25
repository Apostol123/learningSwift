//
//  Message.swift
//  10ChatApp
//
//  Created by user159106 on 1/24/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import Foundation

public class Message{
    var sender: String = ""
    var body: String = ""
    
    public init(sender: String, body: String) {
        self.sender = sender
        self.body = body
    }
    
    public init() {
        self.sender = "Alexandru Apostol"
        self.body = "Este es un mensaje de prueba para la calsse de IOS"
    }
}

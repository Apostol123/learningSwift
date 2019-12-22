//
//  Song.swift
//  ScrappingTheWeb
//
//  Created by user159106 on 11/19/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import Foundation

struct Song {
    let title : String
    let songUrl : String
    let imageURL : String
    let uuid : String
    
    
    init(title: String , songUrl: String, imageURL: String) {
        
        self.uuid =  UUID().uuidString
        self.title = title
        self.songUrl = songUrl
        self.imageURL = imageURL
    }
}

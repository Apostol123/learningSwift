//
//  SongImageExtension.swift
//  ScrappingTheWeb
//
//  Created by user159106 on 11/20/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import UIKit

extension UIImageView{
    func downloadedFrom(link:String, contentMode mode:UIView.ContentMode = .scaleAspectFit){
        
        guard let url = URL(string:link) else {return}
        downloadedFromURL(url: url)
    }
    
    func downloadedFromURL(url:URL, contentMode mode:UIView.ContentMode = .scaleAspectFit) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
           
            guard
                let httpUrlResponse = response as? HTTPURLResponse,
                    httpUrlResponse.statusCode == 200,
                let data = data,
                error == nil,
            let image = UIImage(data: data)
            else {return}
            
            DispatchQueue.main.async() {
                 self.image = image
            }
           
           
        }.resume()
        
    }
    
}

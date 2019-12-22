//
//  SongsFactory.swift
//  ScrappingTheWeb
//
//  Created by user159106 on 11/19/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import Foundation
import Alamofire
import Kanna
    

protocol ReloadData  : AnyObject{
    func reloadData()
}

class SongsFactory {
    var songs = [Song]()
    var songsURL: String
    let session = Alamofire.Session()
    let songDomain = "https://www.bbc.co.uk"
    var completedSongs = 0
    var delegate : ReloadData?
    
    init(songsURL : String) {
        self.songsURL = songsURL
        self.scrapeURL()
        
    }
    
    func scrapeURL() {
        session.request(self.songsURL).responseString { (response) in
            if let responseData = response.value {
                DispatchQueue.main.async() {
                      self.parseHtml(html: responseData)
                }
              
            } else {
                print ("NO RESPONSE ")
            }
        }

    }
    

       func parseHtml(html: String) {
           do {
               let doc = try Kanna.HTML(html: html, encoding: String.Encoding.utf8)
               print(doc)
               print(doc.title)
               
               
               for div in doc.css("div") {
                   if div.className == "sc-c-list gs-u-box-size gel-wrap" {
                      // print(div.text)
                    
                       for ul in div.css("ul"){
                           for li in ul.css("li") {
                            var fullsongURL = ""
                            var imageURL = ""
                            var title = ""
                            
                            for p in li.css("p"){
                                if p.className == "sc-c-metadata__secondary gel-long-primer gs-u-mt-" {
                                    if let songTitle = p.text {
                                        title = songTitle
                                        
                                    }
                                }
                                
                            }
                            for article in li.css("article") {
                                for a in article.css("a"){
                                    if let songURL = a["href"] {
                                       
                                      fullsongURL =   "\(songDomain)\(songURL)"
                                      
                                    }
                                }
                            }
                               for imageDiv in li.css("div"){
                                    
                                   if imageDiv.className == "sc-c-rsimage sc-o-responsive-image sc-o-responsive-image--1by1 " {
                                       for img in imageDiv.css("img"){
                                        if let imgSRC = img["src"] {
                                            imageURL = imgSRC
                                            break
                                        }
                                           
                                       }
                                   }
                               }
                            
                            let song = Song(title: title, songUrl: fullsongURL, imageURL: imageURL)
                            self.songs.append(song)
                            self.checkCompletationStatus()
                            
                           }
                       }
                   }
               }
            
            delegate?.reloadData()
    
                   
              
           } catch {
               print(error)
           }
       }
    
    func checkCompletationStatus() {
        self.completedSongs += 1
        print("Estado de completacion = \(completedSongs) / \(self.songs.count)")
    }
}

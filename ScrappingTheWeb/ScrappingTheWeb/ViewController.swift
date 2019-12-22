//
//  ViewController.swift
//  ScrappingTheWeb
//
//  Created by user159106 on 11/17/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import UIKit
import Alamofire
import Kanna

class ViewController: UICollectionViewController {
     let urlTitle = "https://www.bbc.co.uk/sounds/category/music"
        var factory : SongsFactory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.factory = SongsFactory(songsURL: urlTitle)
        factory.delegate = self
       
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return factory.songs.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "songCell", for: indexPath) as! SongsCell
        cell.labelSong.text = factory.songs[indexPath.row].title
        cell.songImage.downloadedFrom(link: factory.songs[indexPath.row].imageURL)
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = URL(string: self.factory.songs[indexPath.row].songUrl){
            UIApplication.shared.open(url, options: [:]) { (succes) in
                print("Hemos ido a la cancion \(self.factory.songs[indexPath.row].songUrl)")
            }
        }
    }
    
   
}

extension ViewController : ReloadData {
    func reloadData() {
      self.collectionView.reloadData()
    }
    
    
}


//
//  ViewController.swift
//  DatnaManagement
//
//  Created by user159106 on 12/1/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var collectionView: UICollectionView!
    private var content : [CardPresenterSections] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "customView")
    }


}

extension ViewController: ViewControllerProtocol {
    func refresh(_ mode: CardPresenterViewModel) {
        content = mode.sections
    }
    
    
}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.content.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = content[indexPath.row]
        switch item {
            
        case .userData(let name):
            let cell : CustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "customView", for: indexPath) as! CustomCollectionViewCell
            return cell
        }
    }
    
    
}


    


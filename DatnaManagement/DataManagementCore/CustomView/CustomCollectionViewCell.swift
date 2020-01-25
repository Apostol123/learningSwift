//
//  CustomCollectionViewCell.swift
//  DatnaManagement
//
//  Created by user159106 on 12/1/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet var image: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    public func configure(name: String) {
        self.nameLabel.text = name
    }
    
    @IBAction func seeTasksPressed(_ sender: UIButton) {
    }
}

//
//  CellCollectionCollectionViewCell.swift
//  Round One
//
//  Created by Jack Wong on 2017/08/18.
//  Copyright © 2017年 None. All rights reserved.
//

import UIKit

class CellCollectionCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!

    @IBOutlet weak var imgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        widthConstraint.constant = screenWidth - (2 * 12)
        
    }

}

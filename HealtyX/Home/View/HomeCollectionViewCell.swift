//
//  HomeCollectionViewCell.swift
//  HealtyX
//
//  Created by Yavuz Selim BİTMEZ on 7.07.2021.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var bgtitleView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.layer.cornerRadius = 12
        bgView.clipsToBounds = true
    
        bgtitleView.layer.cornerRadius = 10
   
    
    }
    
}

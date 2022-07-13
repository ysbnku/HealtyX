//
//  HomeCollectionViewCell.swift
//  HealtyX
//
//  Created by Yavuz Selim BİTMEZ on 7.07.2021.
//

import UIKit

class ProgramsCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var bgImage: UIImageView!
    @IBOutlet private var bgtitleView: UIView!
    @IBOutlet private var bgView: UIView!
    @IBOutlet private var header: UILabel!
    @IBOutlet private var difficulty: UILabel!
    @IBOutlet private var notificationInfo: UILabel!
    @IBOutlet private var title: UILabel!
    @IBOutlet weak var joinLabel: UILabel!
    
    public var isSelectedCell = true {
        didSet {
            onSelectedCell()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareView()
        
    }
    
    private func onSelectedCell() {
        isSelectedCell ? (joinLabel.text = "Programa Katıl") : (joinLabel.text = "Programa Katılındı")
    }
    private func prepareView(){
        bgView.layer.cornerRadius = 12
        bgView.clipsToBounds = true
        bgtitleView.layer.cornerRadius = 10
    }
    
    
    public func configure(data: Programs) {
        header.text = data.header
        bgImage.image = UIImage(named: data.image!)
        title.text = data.title
        difficulty.text = data.difficulty
        notificationInfo.text = data.notificationInfo
    }
    
}

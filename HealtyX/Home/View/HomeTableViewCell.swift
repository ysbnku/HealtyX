//
//  HomeTableViewCell.swift
//  HealtyX
//
//  Created by Yavuz Selim BİTMEZ on 7.07.2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 5
        bgView.layer.masksToBounds = true
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}

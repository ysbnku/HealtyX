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
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareView()
    }

    private func prepareView() {
        bgView.layer.cornerRadius = 5
        bgView.layer.masksToBounds = true
        selectionStyle = .none
    }
    
    public func configure(data: Healty) {
        header.text = data.title
        bgImage.image = UIImage(named: "hard")
        title.text = data.description
    }
}

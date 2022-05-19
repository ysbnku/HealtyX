//
//  ProfileTableViewCell.swift
//  HealtyX
//
//  Created by Yavuz Selim BİTMEZ on 8.07.2021.
//

import UIKit

class AsistanTableViewCell: UITableViewCell {
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        
        profileView.layer.cornerRadius = 12
        profileView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func showHerProgram(_ sender: Any) {
    }
    
}

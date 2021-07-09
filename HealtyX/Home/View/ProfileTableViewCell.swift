//
//  ProfileTableViewCell.swift
//  HealtyX
//
//  Created by Yavuz Selim BİTMEZ on 8.07.2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var notificationNumber: UITextField!
    @IBOutlet weak var showHerProgramBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        showHerProgramBtn.layer.cornerRadius = 10
        showHerProgramBtn.layer.shadowOpacity = 0.7
        showHerProgramBtn.layer.shadowOffset = .zero
        showHerProgramBtn.layer.shadowRadius = 2
        notificationNumber.backgroundColor = .orange
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func showHerProgram(_ sender: Any) {
    }
    
}

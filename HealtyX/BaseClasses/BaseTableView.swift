//
//  BaseTableView.swift
//  HealtyX
//
//  Created by Yavuz Selim Bitmez  on 19.06.2022.
//

import Foundation
import UIKit

public class BaseTableView: UITableView {
    
    func registerCellWithNibAndIdentifier(_ nibAndIdentifierName: String) {
        let nib = UINib(nibName: nibAndIdentifierName, bundle: nil)
        register(nib, forCellReuseIdentifier: nibAndIdentifierName)
    }
    
    func bindDelegateAndDataSource(_ viewController: UIViewController) {
        delegate = viewController as? UITableViewDelegate
        dataSource = viewController as? UITableViewDataSource
    }
}

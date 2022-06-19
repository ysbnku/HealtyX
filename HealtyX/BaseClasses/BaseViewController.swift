//
//  BaseViewController.swift
//  HealtyX
//
//  Created by Yavuz Selim Bitmez  on 19.06.2022.
//

import Foundation
import UIKit

public class BaseViewController: UIViewController {
    
    func loadViewControllerWithNibName(_ name: String) {
        Bundle.main.loadNibNamed(name, owner: self, options: nil)
    }
}

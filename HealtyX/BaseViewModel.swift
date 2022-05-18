//
//  BaseViewModel.swift
//  HealtyX
//
//  Created by Yavuz Selim Bitmez  on 18.05.2022.
//

import Foundation

class BaseViewModel {
    var alertMessage:String? {
        didSet{
            self.showAlertClosure?()
        }
    }
    var isLoading:Bool = false {
        didSet{
            self.updateLoadingStatusClosure?()
        }
    }
    var updateLoadingStatusClosure:(()->())?
    var showAlertClosure:(()->())?
    var reloadTableViewClosure:(()->())?

}

//
//  HomeViewModel.swift
//  HealtyX
//
//  Created by Yavuz Selim BİTMEZ on 7.07.2021.
//

import Foundation
import UIKit

class HealtyFoodViewModel {
    private var advices:[Healty] = [Healty]()
    var cellViewModels : [HealtyFoodCellViewModel] = [HealtyFoodCellViewModel](){
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    var numberOfCells:Int {
        return cellViewModels.count
    }
    
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
    
    let apiService : APIServiceProtocol
    init( apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    func initFetch(){
        self.isLoading = true
        apiService.fetchHealtyFoods { [weak self](success, advices, error) in
            self?.isLoading = false
            if let error = error {
                self?.alertMessage = error.rawValue
            }else {
                self?.processFetchedPhoto(advices: advices)
            }
        }
    }
    func createCellViewModel( advice: Healty ) -> HealtyFoodCellViewModel {

        //Wrap a description
      
        return HealtyFoodCellViewModel(bgImage: "hard", header: advice.title!, title: advice.description!)
    }
    
    private func processFetchedPhoto(advices:[Healty]){
        self.advices = advices // Cache
        var vms = [HealtyFoodCellViewModel]()
        for advice in advices {
            vms.append(createCellViewModel(advice: advice))
        }
        self.cellViewModels = vms
    }
}

struct HealtyFoodCellViewModel {
    let bgImage:String
    let header:String
    let title:String
}





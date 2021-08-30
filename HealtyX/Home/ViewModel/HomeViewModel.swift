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
    private var categories:[Category] = [Category]()

    var cellViewModels : [HealtyFoodCellViewModel] = [HealtyFoodCellViewModel](){
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    var cellCategoryViewModels : [HealtyCategoryCellViewModel] = [HealtyCategoryCellViewModel](){
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    var numberOfCells:Int {
        return cellViewModels.count
    }
    var numberOfCategoryCells:Int {
        return cellCategoryViewModels.count
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
                self?.processFetchedAdvice(advices: advices)
            }
        }
    }
    func fetchCategories(){
        self.isLoading = true
        apiService.fetchHealtyCategories { [weak self](success, categories, error) in
            self?.isLoading = false
            if let error = error {
                self?.alertMessage = error.rawValue
            }else {
                self?.processFetchedCategory(category: categories)
            }
        }
    }
    func createCellViewModel( advice: Healty ) -> HealtyFoodCellViewModel {
      
        return HealtyFoodCellViewModel(bgImage: "hard", header: advice.title!, title: advice.description!)
    }
    func createCategoryCellViewModel( category: Category ) -> HealtyCategoryCellViewModel {
      
        return HealtyCategoryCellViewModel(id: category.id!,
                                           header: category.header!,
                                           difficulty: category.difficulty!,
                                           notificationInfo: category.notificationInfo!,
                                           title: category.title!,
                                           category: category.category!,
                                           image: category.image!)
    }
    
    private func processFetchedAdvice(advices:[Healty]){
        self.advices = advices // Cache
        var vms = [HealtyFoodCellViewModel]()
        for advice in advices {
            vms.append(createCellViewModel(advice: advice))
        }
        self.cellViewModels = vms
    }
    private func processFetchedCategory(category:[Category]){
        self.categories = category // Cache
        var vms = [HealtyCategoryCellViewModel]()
        for category in categories {
            vms.append(createCategoryCellViewModel(category: category))
        }
        self.cellCategoryViewModels = vms
    }
}

struct HealtyFoodCellViewModel {
    let bgImage:String
    let header:String
    let title:String
}
struct HealtyCategoryCellViewModel {
    let id : Int
    let header : String
    let difficulty : String
    let notificationInfo : String
    let title : String
    let category:String
    let image:String
}





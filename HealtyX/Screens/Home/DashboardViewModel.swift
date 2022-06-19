//
//  HomeViewModel.swift
//  HealtyX
//
//  Created by Yavuz Selim BİTMEZ on 7.07.2021.
//

import Foundation
import UIKit

class DashboardViewModel: BaseViewModel {
    public var advices = [Healty]()
    public var programs = [Programs]()
    let apiService : APIServiceProtocol
    weak var delegate: DataUpdateDelegate?
    
    init( apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    public func initiliaze() {
        fetchCategories()
        fetchHealtyFoods()
    }
    
    private func fetchHealtyFoods() {
        apiService.fetchHealtyFoods { [weak self](success, advices, error) in
            self?.advices = advices
            success ? self?.delegate?.didLoadData() : print("\(String(describing: error?.rawValue))")
        }
    }
    
    private func fetchCategories() {
        apiService.fetchHealtyCategories { [weak self](success, programs, error) in
            self?.programs = programs
            success ? self?.delegate?.didLoadData() : print("\(String(describing: error?.rawValue))")
        }
    }
    
}

protocol DataUpdateDelegate: AnyObject {
    func didLoadData()
}





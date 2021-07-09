//
//  SectionsViewModel.swift
//  HealtyX
//
//  Created by Yavuz Selim BİTMEZ on 9.07.2021.
//

import Foundation

protocol SectionsViewModel {
    var type : HomeSectionsItemType{get}
}
enum HomeSectionsItemType{
    case profile
    case category
    case advices
}

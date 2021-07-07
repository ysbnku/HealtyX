//
//  Healty.swift
//  HealtyX
//
//  Created by Yavuz Selim BİTMEZ on 7.07.2021.
//

import Foundation


struct Healty : Decodable{
    var id : Int?
    var title : String?
    var description : String?
    var priority : Int?
    var category : String?
    var time : String?
    var n_title : [String]?
    var n_body : [String]?
}


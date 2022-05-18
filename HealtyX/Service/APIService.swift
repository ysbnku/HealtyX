//
//  APIService.swift
//  HealtyX
//
//  Created by Yavuz Selim BİTMEZ on 7.07.2021.
//

import Foundation

enum APIError:String,Error {
    case noNetwork = "No Network"
    case serverOverload = "Server is overloaded"
    case permissionDenied = "You don't have permission"
}

protocol APIServiceProtocol {
    func fetchHealtyFoods(complete: @escaping (_ success:Bool,_ Healty:[Healty],_ error:APIError?) ->() )
    func fetchHealtyCategories(complete: @escaping (_ success:Bool,_ Programs:[Programs],_ error:APIError?) ->() )

}
class APIService:APIServiceProtocol {
    func fetchHealtyFoods(complete: @escaping (Bool, [Healty], APIError?) -> ()) {
        let path = Bundle.main.path(forResource: "healty", ofType: "json")
        guard let filePath = path,let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath))  else { return }

        do
        {
            let healtyfoods = try JSONDecoder().decode([Healty].self, from: jsonData)
            complete(true,healtyfoods,nil)
        }
        catch let error{
            print("Json Parse Error : \(error)")
        }
    }
    
    func fetchHealtyCategories(complete: @escaping (Bool, [Programs], APIError?) -> ()) {
        let path = Bundle.main.path(forResource: "Programs", ofType: "json")
        guard let filePath = path,let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath))  else { return}
                
        do
        {
            let programs = try JSONDecoder().decode([Programs].self, from: jsonData)
            complete(true,programs,nil)
        }
        catch let error{
            print("Json Parse Error : \(error)")
        }
    }
    
    
}

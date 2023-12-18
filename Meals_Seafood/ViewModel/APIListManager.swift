//
//  APICaller.swift
//  Meals_Seafood
//
//  Created by Irvan P. Saragi on 18/12/23.
//

import Foundation
import Alamofire

class APIListManager {
    static func getSeafoodMeals(completion: @escaping ([Meal]?) -> Void) {
        let apiUrl = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood"

        AF.request(apiUrl).responseDecodable(of: [String: [Meal]].self) { response in
            switch response.result {
            case .success(let data):
                if let meals = data["meals"] {
                    completion(meals)
                } else {
                    completion(nil)
                }
            case .failure(let error):
                print("Error: \(error)")
                completion(nil)
            }
        }
    }
}

//
//  DetailAPIcaller.swift
//  Meals_Seafood
//
//  Created by Irvan P. Saragi on 18/12/23.
//

import Foundation
import Alamofire

class APIDetailManager {
    static func getMealDetail(mealID: String, completion: @escaping (MealDetail?) -> Void) {
        let apiUrl = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)"

        AF.request(apiUrl).responseDecodable(of: [String: [MealDetail]].self) { response in
            switch response.result {
            case .success(let data):
                if let mealDetail = data["meals"]?.first {
                    completion(mealDetail)
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

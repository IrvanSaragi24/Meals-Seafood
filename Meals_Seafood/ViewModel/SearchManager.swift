//
//  SearchManager.swift
//  Meals_Seafood
//
//  Created by Irvan P. Saragi on 19/12/23.
//

import Foundation

class SeafoodViewModel: ObservableObject {
    @Published var seafoodMeals: [Meal] = []
    @Published var searchText: String = ""

    var filteredMeals: [Meal] {
        if searchText.isEmpty {
            return seafoodMeals
        } else {
            return seafoodMeals.filter { $0.strMeal.localizedCaseInsensitiveContains(searchText) }
        }
    }

    func getSeafoodMeals() {
        APIListManager.getSeafoodMeals { [weak self] meals in
            if let meals = meals {
                DispatchQueue.main.async {
                    self?.seafoodMeals = meals
                }
            }
        }
    }
}

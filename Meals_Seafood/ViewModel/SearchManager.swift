//
//  SearchManager.swift
//  Meals_Seafood
//
//  Created by Irvan P. Saragi on 19/12/23.
//

import Foundation
import SwiftUI

/// The `SeafoodViewModel` class manages the data and logic related to seafood meals in a SwiftUI application.
class SeafoodViewModel: ObservableObject {
    
    /// Published property holding the array of seafood meals.
    @Published var seafoodMeals: [Meal] = []
    
    /// Published property holding the search text used for filtering meals.
    @Published var searchText: String = ""
    
    /// Computed property that returns filtered meals based on the search text.
    var filteredMeals: [Meal] {
        if searchText.isEmpty {
            return seafoodMeals
        } else {
            return seafoodMeals.filter { $0.strMeal.localizedCaseInsensitiveContains(searchText) }
        }
    }

    /// Fetches seafood meals using the `APIListManager` and updates the `seafoodMeals` property.
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


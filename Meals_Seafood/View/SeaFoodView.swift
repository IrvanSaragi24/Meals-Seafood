//
//  SeaFoodView.swift
//  Meals_Seafood
//
//  Created by Irvan P. Saragi on 18/12/23.
//

import SwiftUI
import Alamofire

struct SeaFoodView: View {
    @State private var seafoodMeals: [Meal] = []
    
    var body: some View {
        NavigationStack{
            VStack {
                List(seafoodMeals, id: \.idMeal) { meal in
                    Text(meal.strMeal)
                }
                .onAppear {
                    APIListManager.getSeafoodMeals { meals in
                        if let meals = meals {
                            seafoodMeals = meals
                        }
                    }
                }
            }
            .navigationTitle("Seafood Meals")
        }
        
    }
}

#Preview {
    SeaFoodView()
}

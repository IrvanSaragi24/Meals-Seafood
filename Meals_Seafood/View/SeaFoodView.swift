//
//  SeaFoodView.swift
//  Meals_Seafood
//
//  Created by Irvan P. Saragi on 18/12/23.
//

import SwiftUI
import Alamofire
import SDWebImageSwiftUI

/// The main view displaying a list of seafood meals.
struct SeaFoodView: View {
    /// The view model responsible for managing seafood meal data and logic.
    @StateObject private var viewModel = SeafoodViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // Search bar for filtering meals based on user input
                SearchBar(text: $viewModel.searchText)

                // List of filtered seafood meals
                List(viewModel.filteredMeals, id: \.idMeal) { meal in
                    NavigationLink(destination: DetailView(mealID: meal.idMeal)) {
                        HStack {
                            // Display meal thumbnail using SDWebImageSwiftUI
                            WebImage(url: URL(string: meal.strMealThumb))
                                .resizable()
                                .cornerRadius(10)
                                .frame(width: 50, height: 50)

                            // Display meal name
                            Text(meal.strMeal)
                        }
                    }
                }
                .listStyle(.plain)
                .onAppear {
                    // Fetch seafood meals when the view appears
                    viewModel.getSeafoodMeals()
                }
            }
            .navigationTitle("Seafood Meals")
        }
    }
}

/// A custom search bar component for filtering meals.
struct SearchBar: View {
    /// Binding to the search text provided by the parent view.
    @Binding var text: String

    var body: some View {
        HStack {
            // Text field for entering search queries
            TextField("Search Meals", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    // Dismiss keyboard when the text field is tapped
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }

            // Clear button to reset the search text
            Button(action: {
                text = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
            }
            .padding(.trailing, 10)
            .opacity(text.isEmpty ? 0 : 1)
        }
    }
}

// Preview for the SeaFoodView
#Preview {
    SeaFoodView()
}

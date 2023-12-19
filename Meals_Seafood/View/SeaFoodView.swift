//
//  SeaFoodView.swift
//  Meals_Seafood
//
//  Created by Irvan P. Saragi on 18/12/23.
//

import SwiftUI
import Alamofire
import SDWebImageSwiftUI

struct SeaFoodView: View {
    @StateObject private var viewModel = SeafoodViewModel()

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText)

                List(viewModel.filteredMeals, id: \.idMeal) { meal in
                    NavigationLink(destination: DetailView(mealID: meal.idMeal)) {
                        HStack {
                            WebImage(url: URL(string: meal.strMealThumb))
                                .resizable()
                                .cornerRadius(10)
                                .frame(width: 50, height: 50)
                            Text(meal.strMeal)
                        }
                    }
                }
                .listStyle(.plain)
                .onAppear {
                    viewModel.getSeafoodMeals()
                }
            }
            .navigationTitle("Seafood Meals")
        }
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search Meals", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }

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


#Preview {
    SeaFoodView()
}

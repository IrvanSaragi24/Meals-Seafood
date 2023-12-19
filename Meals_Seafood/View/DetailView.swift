//
//  DetailView.swift
//  Meals_Seafood
//
//  Created by Irvan P. Saragi on 18/12/23.
//

import SwiftUI
import SDWebImageSwiftUI
import WebKit


struct DetailView: View {
    let mealID: String
    @State private var mealDetail: MealDetail?
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                if let mealDetail = mealDetail {
                    ScrollView(.vertical){
                        VStack(alignment: .leading){
                            HStack{
                                Text(mealDetail.strMeal)
                                    .font(.system(size: 25, weight: .bold, design: .rounded))
                                    .padding(.leading, 10)
                                Spacer()
                            }
                            WebImage(url: URL(string: mealDetail.strMealThumb))
                                .resizable()
                                .frame(width: geometry.size.width * 1, height: geometry.size.height / 2.4)
                                .cornerRadius(5)
                                .shadow(radius: 0, y: 2)
                            HStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth : 2)
                                    .frame(width: geometry.size.width * 0.2, height: geometry.size.height / 30)
                                    .overlay {
                                        Text(mealDetail.strCategory)
                                            .font(.caption)
                                    }
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth : 2)
                                    .frame(width: geometry.size.width * 0.2, height: geometry.size.height / 30)
                                    .overlay {
                                        Text(mealDetail.strArea)
                                            .font(.caption)
                                    }
                            }
                            .padding(10)
                            Text("Ingredients : ")
                                .font(.headline)
                                .padding(10)
                            HStack{
                                VStack(alignment : .leading){
                                    Text( mealDetail.strIngredient1 ?? "")
                                    Text( mealDetail.strIngredient2 ?? "")
                                    Text( mealDetail.strIngredient3 ?? "")
                                    Text( mealDetail.strIngredient4 ?? "")
                                    Text( mealDetail.strIngredient5 ?? "")
                                    Text( mealDetail.strIngredient6 ?? "")
                                    Text( mealDetail.strIngredient7 ?? "")
                                    Text( mealDetail.strIngredient8 ?? "")
                                    Text( mealDetail.strIngredient9 ?? "")
                                    Text( mealDetail.strIngredient10 ?? "")
                                    
                                }
                                .padding(.trailing, 10)
                                VStack(alignment : .leading){
                                    Text( mealDetail.strIngredient11 ?? "")
                                    Text( mealDetail.strIngredient12 ?? "")
                                    Text( mealDetail.strIngredient13 ?? "")
                                    Text( mealDetail.strIngredient14 ?? "")
                                    Text( mealDetail.strIngredient15 ?? "")
                                    Text( mealDetail.strIngredient16 ?? "")
                                    Text( mealDetail.strIngredient17 ?? "")
                                    Text( mealDetail.strIngredient18 ?? "")
                                    Text( mealDetail.strIngredient19 ?? "")
                                    Text( mealDetail.strIngredient20 ?? "")
                                    
                                }
                            }
                            .font(.footnote)
                            .foregroundStyle(.black)
                            .padding(.leading, 12)
                            
                            Divider()
                            Text("Instructions :")
                                .font(.headline)
                                .padding(10)
                            Text(mealDetail.strInstructions)
                                .padding()
                            Divider()
                            Text("Tutorial :")
                                .font(.headline)
                                .padding(10)
                            
                            WebView(url: URL(string: mealDetail.strYoutube))
                                .frame(height: geometry.size.height / 2)
                        }
                        .padding(.top, geometry.size.width * 0.27)
                    }
                    .ignoresSafeArea()
                    
                } else {
                    ProgressView()
                }
            }
        }
        .onAppear {
            APIDetailManager.getMealDetail(mealID: mealID) { detail in
                if let detail = detail {
                    mealDetail = detail
                }
            }
        }
    }
}

#Preview {
    DetailView(mealID: "52772")
}





//
//  MealsListView.swift
//  SimplyCooking
//
//  Created by Marilyn Du on 12/9/22.
//

import SwiftUI

struct MealsListView: View {
    @StateObject var mealVM = MealViewModel()
    @State var selectedCategory: Category = .Beef
    @State var image = "heart"
    
    enum Category: String, CaseIterable {
        case Beef, Chicken, Dessert, Lamb, Miscellaneous, Pasta, Pork, Seafood, Side, Starter, Vegan, Vegetarian, Breakfast, Goat
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Pick a category of recipes:")
                        .bold()
                    Picker("", selection: $selectedCategory) {
                        ForEach(Category.allCases, id: \.self) { category in
                            Text(category.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                    .onChange(of: selectedCategory) { _ in
                        mealVM.urlString = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(selectedCategory.rawValue)"
                        mealVM.mealsArray = []
                        Task {
                            await mealVM.getData()
                        }
                    }
                }
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(mealVM.mealsArray) { meal in
                            VStack {
                                IconView(meal: meal)
                                Button {
                                    Task {
                                        _ = await mealVM.saveFavorite(favorite: Favorite(strMeal: meal.strMeal, strMealThumb: meal.strMealThumb, idMeal: meal.idMeal))
                                    }
                                } label: {
                                    Image(systemName: image)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Pick a Recipe")
            .navigationBarTitleDisplayMode(.large)
            Spacer()
        }
        .task {
            mealVM.urlString = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(selectedCategory.rawValue)"
            await mealVM.getData()
        }
    }
}

struct MealsListView_Previews: PreviewProvider {
    static var previews: some View {
        MealsListView()
            .environmentObject(MealViewModel())
    }
}


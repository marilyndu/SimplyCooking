//
//  DetailView.swift
//  SimplyCooking
//
//  Created by Marilyn Du on 12/9/22.
//

import SwiftUI

struct DetailView: View {
    @StateObject var mealDetailVM = MealDetailViewModel()
    var meal: Meal
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    AsyncImage(url: URL(string: getRecipe().strMealThumb)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200, alignment: .center)
                            .cornerRadius(15)
                    } placeholder: {
                        Image(systemName: "fork.knife.circle")
                    }
                    Text("\(getRecipe().strMeal)")
                        .bold()
                        .font(.title)
                        .frame(alignment: .center)
                        
                    
                    VStack(alignment: .leading) {
                        Text("Ingredients")
                            .bold()
                            .font(.title3)
                        VStack(alignment: .leading) {
                            Group {
                                if !getRecipe().strMeasure1.isEmpty {Text("\(getRecipe().strMeasure1) \(getRecipe().strIngredient1)")}
                                if !getRecipe().strMeasure2.isEmpty {Text("\(getRecipe().strMeasure2) \(getRecipe().strIngredient2)")}
                                if !getRecipe().strMeasure3.isEmpty {Text("\(getRecipe().strMeasure3) \(getRecipe().strIngredient3)")}
                                if !getRecipe().strMeasure4.isEmpty {Text("\(getRecipe().strMeasure4) \(getRecipe().strIngredient4)")}
                                if !getRecipe().strMeasure5.isEmpty {Text("\(getRecipe().strMeasure5) \(getRecipe().strIngredient5)")}
                                if !getRecipe().strMeasure6.isEmpty {Text("\(getRecipe().strMeasure6) \(getRecipe().strIngredient6)")}
                                if !getRecipe().strMeasure7.isEmpty {Text("\(getRecipe().strMeasure7) \(getRecipe().strIngredient7)")}
                                if !getRecipe().strMeasure8.isEmpty {Text("\(getRecipe().strMeasure8) \(getRecipe().strIngredient8)")}
                                if !getRecipe().strMeasure9.isEmpty {Text("\(getRecipe().strMeasure9) \(getRecipe().strIngredient9)")}
                                if !getRecipe().strMeasure10.isEmpty {Text("\(getRecipe().strMeasure10) \(getRecipe().strIngredient10)")}
                            }
                            Group {
                                if !getRecipe().strMeasure11.isEmpty {Text("\(getRecipe().strMeasure11) \(getRecipe().strIngredient11)")}
                                if !getRecipe().strMeasure12.isEmpty {Text("\(getRecipe().strMeasure12) \(getRecipe().strIngredient12)")}
                                if !getRecipe().strMeasure13.isEmpty {Text("\(getRecipe().strMeasure13) \(getRecipe().strIngredient13)")}
                                if !getRecipe().strMeasure14.isEmpty {Text("\(getRecipe().strMeasure14) \(getRecipe().strIngredient14)")}
                                if !getRecipe().strMeasure15.isEmpty {Text("\(getRecipe().strMeasure15) \(getRecipe().strIngredient15)")}
                                if !getRecipe().strMeasure16.isEmpty {Text("\(getRecipe().strMeasure16) \(getRecipe().strIngredient16)")}
                                if !getRecipe().strMeasure17.isEmpty {Text("\(getRecipe().strMeasure17) \(getRecipe().strIngredient17)")}
                                if !getRecipe().strMeasure18.isEmpty {Text("\(getRecipe().strMeasure18) \(getRecipe().strIngredient18)")}
                                if !getRecipe().strMeasure19.isEmpty {Text("\(getRecipe().strMeasure19) \(getRecipe().strIngredient19)")}
                                if !getRecipe().strMeasure20.isEmpty {Text("\(getRecipe().strMeasure20) \(getRecipe().strIngredient20)")}
                            }
                        }

                        Spacer()
                        
                        Text("Recipe Instructions")
                            .bold()
                            .font(.title3)
                        Text(getRecipe().strInstructions)
                        
                    }
                }
                .padding()
                .task {
                    mealDetailVM.urlString = meal.urlString()
                    await mealDetailVM.getData()
                }
            }
        }
    }
    
    func getRecipe() -> Recipe {
        if let recipeIndex = mealDetailVM.recipes.firstIndex(where: {$0.idMeal == meal.idMeal}) {
            let recipe = mealDetailVM.recipes[recipeIndex]
            return recipe
        } else {
            return Recipe(idMeal: "", strMeal: "", strMealThumb: "", strInstructions: "", strIngredient1: "", strIngredient2: "", strIngredient3: "", strIngredient4: "", strIngredient5: "", strIngredient6: "", strIngredient7: "", strIngredient8: "", strIngredient9: "", strIngredient10: "", strIngredient11: "", strIngredient12: "", strIngredient13: "", strIngredient14: "", strIngredient15: "", strIngredient16: "", strIngredient17: "", strIngredient18: "", strIngredient19: "", strIngredient20: "", strMeasure1: "", strMeasure2: "", strMeasure3: "", strMeasure4: "", strMeasure5: "", strMeasure6: "", strMeasure7: "", strMeasure8: "", strMeasure9: "", strMeasure10: "", strMeasure11: "", strMeasure12: "", strMeasure13: "", strMeasure14: "", strMeasure15: "", strMeasure16: "", strMeasure17: "", strMeasure18: "", strMeasure19: "", strMeasure20: "")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(meal: Meal(strMeal: "Beef and Mustard Pie", strMealThumb: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg", idMeal: "52874"))
    }
}


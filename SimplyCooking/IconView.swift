//
//  IconView.swift
//  SimplyCooking
//
//  Created by Marilyn Du on 12/9/22.
//

import SwiftUI

struct IconView: View {
    var meal: Meal

    var body: some View {
        ZStack {
            HStack {
                NavigationLink {
                    DetailView(meal: meal)
                } label: {
                    VStack {
                        AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .cornerRadius(15)
                                .shadow(radius: 10)
                        } placeholder: {
                            Image(systemName: "fork.knife.circle")
                        }
                        Text(meal.strMeal.capitalized)
                            .font(.callout)
                            .foregroundColor(.black)
                            .bold()
                    }
                }
            }
        }
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(meal: Meal(strMeal: "Beef and Mustard Pie", strMealThumb: "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg", idMeal: "52874"))
    }
}

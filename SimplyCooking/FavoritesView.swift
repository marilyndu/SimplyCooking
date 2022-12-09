//
//  FavoritesView.swift
//  SimplyCooking
//
//  Created by Marilyn Du on 12/9/22.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct FavoritesView: View {
    @FirestoreQuery(collectionPath: "favorites") var favorites: [Favorite]
    var body: some View {
        NavigationStack {
            Text("Favorite Recipes")
                .bold()
                .font(.title)
            List(favorites) { favorite in
                NavigationLink {
                    DetailView(meal: Meal(strMeal: favorite.strMeal, strMealThumb: favorite.strMealThumb, idMeal: favorite.idMeal))
                } label: {
                    Text(favorite.strMeal)
                        .font(.title2)
                }
            }
            .listStyle(.plain)

        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}

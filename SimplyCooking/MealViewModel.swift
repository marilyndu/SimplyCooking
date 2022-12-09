//
//  MealViewModel.swift
//  SimplyCooking
//
//  Created by Marilyn Du on 12/9/22.
//

import Foundation
import FirebaseFirestore

@MainActor
class MealViewModel: ObservableObject {
    private struct Returned: Codable {
        var meals: [Meal]
    }
    
    var urlString = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Beef"
    @Published var mealsArray: [Meal] = []
    @Published var isLoading = false
    
//    @Published var favorites: [Meal] = [Meal(strMeal: "Beef and Mustard Pie", strMealThumb: "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg", idMeal: "52874")]
    
    func getData() async {
        print("🕸 We are accessing the url \(urlString)")
        isLoading = true
        
        // convert urlString to a special URL type
        guard let url = URL(string: urlString) else {
            print("😡 ERROR: Could not create a URL from \(urlString)")
            isLoading = false
            return
        }
        do {
            let(data, _) = try await URLSession.shared.data(from: url)
            
            // Try to decode JSON data into our own data structures
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                print("😡 JSON ERROR: Could not decode returned JSON data")
                isLoading = false
                return
            }
            self.mealsArray = self.mealsArray + returned.meals
            isLoading = false
        } catch {
            isLoading = false
            print("😡 ERROR: Could not use URL at \(urlString) to get data and response")
        }
    }
    
    func saveFavorite(favorite: Favorite) async -> Bool {
        let db = Firestore.firestore()
        if let id = favorite.id {
            do {
                try await db.collection("favorites").document(id).setData(favorite.dictionary)
                print("Data updated successfully")
                return true
            } catch {
                print("Could not update data in meals \(error.localizedDescription)")
                return false
            }
        } else {
            do {
                _ = try await db.collection("favorites").addDocument(data: favorite.dictionary)
                print("Data added successfully")
                return true
            } catch {
                print("Could not create a new spot in meals \(error.localizedDescription)")
                return false
            }
        }
    }
}

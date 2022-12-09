//
//  MealDetailViewModel.swift
//  SimplyCooking
//
//  Created by Marilyn Du on 12/9/22.
//

import Foundation

@MainActor
class MealDetailViewModel: ObservableObject {
    private struct Returned: Codable {
        var meals: [Recipe]
    }
    
    var urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=52772"
    @Published var recipes: [Recipe] = []
    @Published var isLoading = false
        
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
            self.recipes = returned.meals
            isLoading = false
        } catch {
            isLoading = false
            print("😡 ERROR: Could not use URL at \(urlString) to get data and response")
        }
    }
}

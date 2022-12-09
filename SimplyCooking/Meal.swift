//
//  Meal.swift
//  SimplyCooking
//
//  Created by Marilyn Du on 12/9/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Meal: Codable, Identifiable {
    let id = UUID().uuidString
    var strMeal: String
    var strMealThumb: String
    var idMeal: String
    
    func urlString() -> String {
        return "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)"
    }
    
    enum CodingKeys: CodingKey {
        case strMeal, strMealThumb, idMeal
    }
}

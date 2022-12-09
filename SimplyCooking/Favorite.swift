//
//  Favorite.swift
//  SimplyCooking
//
//  Created by Marilyn Du on 12/9/22.
//

import Foundation
import FirebaseFirestoreSwift
import CoreLocation

struct Favorite: Identifiable, Codable, Equatable {
    @DocumentID var id: String?
    var strMeal: String
    var strMealThumb: String
    var idMeal: String
    
    var dictionary: [String: Any] {
        return ["strMeal": strMeal, "strMealThumb": strMealThumb, "idMeal": idMeal]
    }
    
    func urlString() -> String {
        return "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)"
    }
}

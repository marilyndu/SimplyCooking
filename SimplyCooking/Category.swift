//
//  Category.swift
//  SimplyCooking
//
//  Created by Marilyn Du on 12/9/22.
//

import Foundation

struct Category: Codable, Identifiable {
    let id = UUID().uuidString
    var strCategory: String
    var strCategoryThumb: String
    
    enum CodingKeys: CodingKey {
        case strCategory, strCategoryThumb
    }
}

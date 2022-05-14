//
//  Recipe.swift
//  HobHacks_iOS
//
//  Created by Arjun Doel on 14/05/2022.
//

import Foundation

typealias RecipeData = RecipeQuery.Data.RecipeCollection

struct RecipeCollection: Codable {
    let recipes: [Recipe]
    
    init(_ recipeCollection: RecipeData?) {
        self.recipes = recipeCollection?.recipes.map({ recipe -> Recipe in
            Recipe(recipe)
        }) ?? []
    }
}

struct Recipe: Identifiable, Codable {
    let id: String
    let publishedAt: String
    let recipeName: String
    let origin: String
    let type: String
    let ingredients: [String?]
    let categories: [String?]
    let recipeImage: String
    
    init(_ recipe: RecipeData.Recipe?) {
        self.id = recipe?.sys.id ?? ""
        self.publishedAt = recipe?.sys.publishedAt ?? ""
        self.recipeName = recipe?.recipeName ?? ""
        self.origin = recipe?.origin ?? ""
        self.type = recipe?.type ?? ""
        self.ingredients = recipe?.ingredients ?? [""]
        self.categories = recipe?.categories ?? [""]
        self.recipeImage = recipe?.recipeImage?.url ?? ""
    }
}

//query Recipe {
//  recipeCollection {
//    recipes: items {
//      sys {
//        publishedAt
//                    id
//      }
//      recipeName
//      origin
//      type
//      ingredients
//      date
//      categories
//      recipeImage {
//        url
//      }
//    }
//  }
//}

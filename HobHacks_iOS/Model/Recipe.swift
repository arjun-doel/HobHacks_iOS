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
    let recipeType: String
    let recipeMethodLong: String
    let origin: String
    let recipeImage: String
    let recipeVideo: String
    let recipeRating: Int
    let recipeSource: String
    let recipeCategories: [String?]
    let recipeIngredients: [String?]
    
    init(_ recipe: RecipeData.Recipe?) {
        self.id = recipe?.sys.id ?? ""
        self.publishedAt = recipe?.sys.publishedAt ?? ""
        self.recipeName = recipe?.recipeName ?? ""
        self.recipeType = recipe?.recipeType ?? ""
        self.recipeMethodLong = recipe?.recipeMethodLong ?? ""
        self.origin = recipe?.origin ?? ""
        self.recipeImage = recipe?.recipeImage?.url ?? ""
        self.recipeVideo = recipe?.recipeVideo ?? ""
        self.recipeRating = recipe?.recipeRating ?? 0
        self.recipeSource = recipe?.recipeSource ?? ""
        self.recipeCategories = recipe?.recipeCategories ?? [""]
        self.recipeIngredients = recipe?.recipeIngredients ?? [""]
    }
}

//query Recipe {
//  recipeCollection {
//    recipes: items {
//      sys {
//        id
//        publishedAt
//      }
//      recipeName
//      recipeType
//      recipeMethodLong
//      origin
//      recipeImage {
//        url
//      }
//      recipeVideo
//      recipeRating
//      recipeSource
//      recipeCategories
//      recipeIngredients
//    }
//  }
//}

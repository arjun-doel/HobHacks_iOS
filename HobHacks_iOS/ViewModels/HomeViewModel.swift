//
//  HomeViewModel.swift
//  HobHacks_iOS
//
//  Created by Arjun Doel on 14/05/2022.
//

import Foundation
import Apollo

@MainActor
class HomeViewModel: ObservableObject {
    @Published public private(set) var recipes: [Recipe] = []
    
    private func queryRecipe() async throws -> GraphQLResult<RecipeQuery.Data>? {
        return await withCheckedContinuation{ continuation in
            Network.shared.apollo.fetch(query: RecipeQuery()) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult)
                case .failure(let error):
                    if let error = error as? Never {
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
    }
    
    func fetch() async {
        do {
            let result = try await queryRecipe()
            if let result = result {
                if let recipeCollection = result.data?.recipeCollection {
                    self.recipes = process(data: recipeCollection)
                    print(recipes)
                }
            }
        } catch {
            print("Error", error)
        }
    }
    
    private func process(data: RecipeData) -> [Recipe] {
        let content = RecipeCollection.init(data)
        
        return content.recipes
    }
}
